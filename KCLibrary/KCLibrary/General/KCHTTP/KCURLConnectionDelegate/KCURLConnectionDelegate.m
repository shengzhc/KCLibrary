//
//  KCURLConnectionDelegate.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCURLConnectionDelegate.h"

#import "KCError.h"
#import "KCLog.h"
#import "KCHTTPError.h"

#import "KCHTTPURLResponseHandler.h"
#import "KCURLConnectionTimerManager.h"
#import "KCURLConnectionThreadManager.h"

@interface KCURLConnectionDelegate()

@property (nonatomic, strong) KCURLConnectionTimerManager *timeoutManager;
@property (nonatomic, strong) KCHTTPURLResponseHandler *HTTPURLResponseHandler;

@property (nonatomic, weak) NSURLConnection *URLConnection;

@end

@implementation KCURLConnectionDelegate

- (id)initWithTimeoutManager:(KCURLConnectionTimerManager *)timeoutManager
  URLConnectionThreadManager:(KCURLConnectionThreadManager *)URLConnectionThreadManager
      HTTPURLResponseHandler:(KCHTTPURLResponseHandler *)HTTPURLResponseHandler
{
    self = [super init];
    
    if (self)
    {
        self.timeoutManager = timeoutManager;
        self.HTTPURLResponseHandler = HTTPURLResponseHandler;
        self.URLConnectionThreadManager = URLConnectionThreadManager;
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)nullifyHelperObjects
{
    self.timeoutManager = nil;
    self.HTTPURLResponseHandler = nil;
}

- (void)connection:(NSURLConnection *)connection
    didReceiveResponse:(NSURLResponse *)response
{
    self.URLConnection = connection;
    self.HTTPURLResponse = (NSHTTPURLResponse *)response;
    
    self.receivedData = [[NSMutableData alloc] init];
    
    KCDebugLog(@"Response code : %@", @(self.HTTPURLResponse.statusCode));
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    KCDebugLog(@"Connection failed! Error - %@ %@", error.localizedDescription,
               [error.userInfo valueForKey: NSURLErrorFailingURLStringErrorKey]);
    
    KCError *connectionError = [KCError error];
    
    if (error.code == -1009 || error.code == - 1001 || error.code == -1004)
    {
        [KCHTTPError addErrorType:KCHTTPErrorConnectionFormation
                          toError:connectionError];
    }
    
    if (error.code == -1012)
    {
        error = nil;
        self.HTTPURLResponse = [[NSHTTPURLResponse alloc] initWithURL:nil
                                                           statusCode:401
                                                          HTTPVersion:nil
                                                         headerFields:nil];
    }
    if (error)
    {
        [connectionError.errors addObject:error];
    }
    
    [self executeHandlerAndCleanUp:connectionError];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    KCDebugLog(@"Succeeded! Received %@ bytes of data", @(self.receivedData.length));
    
    [self executeHandlerAndCleanUp:[KCError error]];
}

- (void)executeHandlerAndCleanUp:(KCError *)error
{
    [self invalidateTimerAndStopListening];
    
    [self.HTTPURLResponseHandler queueHandler:self.URLConnectionThreadManager.operationQueue
                                     response:self.HTTPURLResponse
                                         data:self.receivedData
                                        error:error];
    
    [self nullifyHelperObjects];
    
}

- (void)startTimer
{
    [self invalidateTimerAndStopListening];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(connectionDidTimeout)
                                                 name:KCURLConnectionTimoutNotification
                                               object:self.timeoutManager];
    
    [self.timeoutManager startTimer];
}

- (void)invalidateTimerAndStopListening
{
    [self.timeoutManager invalidateTimer];
    
    [[NSNotificationCenter defaultCenter] removeObject:self];
}

- (void)connectionDidTimeout
{
    [self.URLConnection cancel];
    
    KCError *error = [KCError error];
    [KCHTTPError addErrorType:KCHTTPErrorTimeout
                      toError:error];
    [self executeHandlerAndCleanUp:error];
}




@end

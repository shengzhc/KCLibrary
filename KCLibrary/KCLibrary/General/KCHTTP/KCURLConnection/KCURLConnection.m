//
//  KCURLConnection.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCURLConnection.h"
#import "KCMutableURLRequest.h"
#import "KCURLConnectionDelegate.h"

#import "KCLog.h"

@interface KCURLConnection()

@property (nonatomic, strong) NSString *requestURL;
@property (nonatomic, strong) NSString *requestMethod;

@end

@implementation KCURLConnection

- (id)initWithRequest:(KCMutableURLRequest *)request
             delegate:(KCURLConnectionDelegate *)delegate
{
    self = [super initWithRequest:request
                         delegate:delegate
                 startImmediately:NO];
    
    if (self)
    {
        self.requestURL = [[request URL] description];
        self.requestMethod = [request HTTPMethod];
        self.delegate = delegate;
    }
    
    return self;
}

- (void)start
{
    [super start];
    
    KCDebugLog(@"%@", [NSString stringWithFormat:@"Starting %@ request: %@", self.requestMethod, self.requestURL]);
    
}

+ (NSTimeInterval)tenSeconds
{
    return 10;
}

+ (NSTimeInterval)twentySeconds
{
    return 20;
}

+ (NSTimeInterval)thirtySeconds
{
    return 30;
}

+ (NSTimeInterval)fortySeconds
{
    return 40;
}

+ (NSTimeInterval)oneMinute
{
    return 60;
}

+ (NSTimeInterval)fourMinutes
{
    return 240;
}

@end

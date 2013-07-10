//
//  KCURLConnectionDelegate.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCURLConnectionTimerManager;
@class KCHTTPURLResponseHandler;
@class KCURLConnectionThreadManager;

@interface KCURLConnectionDelegate : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *receivedData;

@property (nonatomic, strong) NSHTTPURLResponse *HTTPURLResponse;

@property (nonatomic, strong) KCURLConnectionThreadManager *URLConnectionThreadManager;

- (id)initWithTimeoutManager:(KCURLConnectionTimerManager *)timeoutManager
  URLConnectionThreadManager:(KCURLConnectionThreadManager *)URLConnectionThreadManager
      HTTPURLResponseHandler:(KCHTTPURLResponseHandler *)HTTPURLResponseHandler;

- (void)startTimer;

@end

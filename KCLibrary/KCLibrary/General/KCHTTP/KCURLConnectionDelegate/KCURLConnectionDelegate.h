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

@interface KCURLConnectionDelegate : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *receivedData;

@property (nonatomic, strong) NSHTTPURLResponse *HTTLURLResponse;

- (id)initWithTimeoutManager:(KCURLConnectionTimerManager *)timeoutManager
      HTTPURLResponseHandler:(KCHTTPURLResponseHandler *)HTTPURLResponseHandler;

@end

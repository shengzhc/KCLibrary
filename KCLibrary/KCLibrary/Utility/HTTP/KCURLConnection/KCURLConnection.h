//
//  KCURLConnection.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCURLConnectionDelegate;
@class KCMutableURLRequest;

@interface KCURLConnection : NSURLConnection

@property (nonatomic, strong) KCURLConnectionDelegate *delegate;

- (id)initWithRequest:(KCMutableURLRequest *)request
             delegate:(KCURLConnectionDelegate *)delegate;

+ (NSTimeInterval)tenSeconds;
+ (NSTimeInterval)twentySeconds;
+ (NSTimeInterval)thirtySeconds;
+ (NSTimeInterval)fortySeconds;
+ (NSTimeInterval)oneMinute;
+ (NSTimeInterval)fourMinutes;

@end

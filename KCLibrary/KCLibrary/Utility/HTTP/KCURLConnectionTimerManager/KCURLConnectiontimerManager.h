//
//  KCURLConnectiontimerManager.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KCURLConnectionTimoutNotification @"KCURLConnectionTimoutNotification"

@interface KCURLConnectionTimerManager : NSObject

- (id)initWithTimeoutInterval:(NSTimeInterval)timeoutInterval;

- (void)startTimer;

- (void)invalidateTimer;

- (void)connectionDidTimeout;

@end

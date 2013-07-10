//
//  KCURLConnectiontimerManager.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCURLConnectionTimerManager.h"
#import "KCLog.h"

@interface KCURLConnectionTimerManager()

@property (nonatomic, strong) NSTimer *timeoutTimer;

@end

@implementation KCURLConnectionTimerManager

- (id)initWithTimeoutInterval:(NSTimeInterval)timeoutInterval
{
    self = [super init];
    
    if (self)
    {
        self.timeoutTimer = [NSTimer timerWithTimeInterval:timeoutInterval
                                                target:self
                                                  selector:@selector(connectionDidTimeout)
                                                  userInfo:nil
                                                   repeats:NO];
    }
    
    return self;
}

- (void)startTimer
{
    [[NSRunLoop mainRunLoop] addTimer:self.timeoutTimer
                              forMode:NSDefaultRunLoopMode];
}

- (void)invalidateTimer
{
    [self.timeoutTimer invalidate];
}

- (void)connectionDidTimeout
{
    KCDebugLog(@"Connection time out by means of [%@ connectionDidTimeout].", [self class]);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KCURLConnectionTimoutNotification
                                                        object:self];
}

@end

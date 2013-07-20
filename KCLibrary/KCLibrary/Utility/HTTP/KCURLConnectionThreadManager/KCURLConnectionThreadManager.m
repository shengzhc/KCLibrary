//
//  KCURLConnectionThreadManager.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCURLConnectionThreadManager.h"

@interface KCURLConnectionThreadManager()

@property (nonatomic, strong) NSRunLoop *runLoop;
@property (nonatomic, assign) NSTimeInterval runDuration;

@end

@implementation KCURLConnectionThreadManager

- (id)initWithRunLoop:(NSRunLoop *)runLoop
          runDuration:(NSTimeInterval)runDuration
       operationQueue:(NSOperationQueue *)operationQueue
{
    self = [super init];
    
    if (self)
    {
        self.runLoop = runLoop;
        self.runDuration = runDuration;
        self.operationQueue = operationQueue;
    }
    
    return self;
}

- (void)scheduleDelegateMessagesForURLConnection:(KCURLConnection *)URLConnection
{
    
}

@end

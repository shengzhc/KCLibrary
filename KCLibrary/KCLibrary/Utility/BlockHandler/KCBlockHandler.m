//
//  KCBlockHandler.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 6/22/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCBlockHandler.h"

@implementation KCBlockHandler


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Void argument
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

+ (void)attemptToExecuteBlock:(KCVoidBlock)block
{
    if (block)
    {
        block();
    }
}

+ (void)attemptToExecuteBlockInBackground:(KCVoidBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
    {
        [self attemptToExecuteBlock:block];
    });
}

+ (void)attemptToExecuteBlockOnMainThread:(KCVoidBlock)block
{
    if ([NSThread isMainThread])
    {
        [self attemptToExecuteBlock:block];
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [self attemptToExecuteBlock:block];
    });
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Bool argument
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

+ (void)attemptToExecuteBlock:(KCBoolBlock)block withBoolean:(BOOL)boolean
{
    if (block)
    {
        block(boolean);
    }
}

+ (void)attemptToExecuteBlockInBackground:(KCBoolBlock)block withBoolean:(BOOL)boolean
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
    {
        [self attemptToExecuteBlock:block withBoolean:boolean];
    });
}

+ (void)attemptToExecuteBlockOnMainThread:(KCBoolBlock)block withBoolean:(BOOL)boolean
{
    if ([NSThread isMainThread])
    {
        [self attemptToExecuteBlock:block withBoolean:boolean];
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [self attemptToExecuteBlock:block withBoolean:boolean];
    });
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Object argument
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

+ (void)attemptToExecuteBlock:(KCBlock)block withObject :(id)object
{
    if (block)
    {
        block(object);
    }
}

+ (void)attemptToExecuteBlockInBackground:(KCBlock)block withObject:(id)object
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^
    {
        [self attemptToExecuteBlock:block withObject:object];
    });
}

+ (void)attemptToExecuteBlockOnMainThread:(KCBlock)block withObject:(id)object
{
    if ([NSThread isMainThread])
    {
        [self attemptToExecuteBlock:block withObject:object];
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [self attemptToExecuteBlock:block withObject:object];
    });
}

@end

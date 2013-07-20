//
//  KCBlockHandler.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 6/22/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^KCVoidBlock)(void);
typedef void (^KCBoolBlock)(BOOL);
typedef void (^KCBlock)(id);

@interface KCBlockHandler : NSObject

+ (void)attemptToExecuteBlock:(KCVoidBlock)block;
+ (void)attemptToExecuteBlockInBackground:(KCVoidBlock)block;
+ (void)attemptToExecuteBlockOnMainThread:(KCVoidBlock)block;
+ (void)attemptToExecuteBlock:(KCBoolBlock)block withBoolean:(BOOL)boolean;
+ (void)attemptToExecuteBlockInBackground:(KCBoolBlock)block withBoolean:(BOOL)boolean;
+ (void)attemptToExecuteBlockOnMainThread:(KCBoolBlock)block withBoolean:(BOOL)boolean;
+ (void)attemptToExecuteBlock:(KCBlock)block withObject:(id)object;
+ (void)attemptToExecuteBlockInBackground:(KCBlock)block withObject:(id)object;
+ (void)attemptToExecuteBlockOnMainThread:(KCBlock)block withObject:(id)object;

@end

//
//  KCError.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCError : NSObject

@property (nonatomic, strong) NSMutableArray *errors;

+ (KCError *)error;
+ (KCError *)errorWithErrorType:(NSUInteger)errorType;
+ (NSArray *)errorArray;


+ (BOOL)error:(KCError *)error containsErrorType:(NSUInteger)errorType;
+ (void)addErrorType:(NSUInteger)errorType
             toError:(KCError *)error;
+ (void)addErrorType:(NSUInteger)errorType
             toError:(KCError *)error
   withOriginalError:(KCError *)originalError;

- (BOOL)isValid;
- (void)appendErrors:(KCError *)error;

@end

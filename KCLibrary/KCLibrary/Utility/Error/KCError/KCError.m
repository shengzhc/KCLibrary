//
//  KCError.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCError.h"
#import "NSArray+Extension.h"

@implementation KCError

- (id)init
{
    self = [super init];
    if (self)
    {
        self.errors = [NSMutableArray new];
    }
    return self;
}

+ (NSString *)classKey
{
    return @"class";
}

+ (NSString *)failureReasonKey
{
    return @"failureReason";
}

+ (NSArray *)errorArray
{
    return nil;
}

+ (KCError *)error
{
    return [[self alloc] init];
}

+ (KCError *)errorWithErrorType:(NSUInteger)errorType
{
    KCError *error = [self error];
    [self addErrorType:errorType toError:error];
    return error;
}

+ (BOOL)error:(KCError *)error containsErrorType:(NSUInteger)errorType
{
    for (NSError *s_error in error.errors)
    {
        if (s_error.code == errorType &&
            [[s_error.userInfo valueForKey:[self classKey]] isEqualToString:[[self class] description]])
        {
            return YES;
        }
    }
    return NO;
}

+ (void)addErrorType:(NSUInteger)errorType
             toError:(KCError *)error
{
    NSError *newError = [[NSError alloc] initWithDomain:
                         [[NSBundle mainBundle] bundleIdentifier] ? [[NSBundle mainBundle] bundleIdentifier] : @""
                                                   code:errorType
                                            userInfo:@{
                         [self failureReasonKey] : [[self errorArray] stringWithEnum:errorType],
                         [self classKey] : [[self class] description]
                         }];
    
    [error addError:newError];
}


+ (void)addErrorType:(NSUInteger)errorType
             toError:(KCError *)error
   withOriginalError:(KCError *)originalError
{
    [self addErrorType:errorType
               toError:error];
}

- (BOOL)isValid
{
    return self.errors.count == 0;
}

- (void)addError:(NSError *)error
{
    [self.errors addObject:error];
}

- (void)appendErrors:(KCError *)error
{
    if (error.errors)
    {
        [self.errors addObjectsFromArray:error.errors];
    }
}


@end

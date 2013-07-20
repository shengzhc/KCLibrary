//
//  NSObject+KCJSONSerialization.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSObject+KCJSONSerialization.h"
#import "KCJSONError.h"

#import "NSDictionary+KCJSONSerialization.h"
#import "NSArray+KCJSONSerialization.h"

@implementation NSObject (KCJSONSerialization)

- (NSString *)stringValue:(KCError *)error
{
    if ([self isKindOfClass:[NSDictionary class]])
    {
        return [(NSDictionary *)self stringValue:error];
    }
    else if ([self isKindOfClass:[NSArray class]])
    {
        return [(NSArray *)self stringValue:error];
    }
    
    [KCJSONError addErrorType:KCJSONErrorIncorrectType
                      toError:error];
    return nil;
}


@end

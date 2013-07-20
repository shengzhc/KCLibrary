//
//  NSArray+KCJSONSerialization.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSArray+KCJSONSerialization.h"
#import "KCJSONError.h"

@implementation NSArray (KCJSONSerialization)

- (NSString *)stringValue:(KCError *)error
{
    NSData *data = [self dataValue:error];
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}

- (NSData *)dataValue:(KCError *)error
{
    NSError *JSONError = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:kNilOptions
                                                     error:&JSONError];
    if (!data)
    {
        [KCJSONError addErrorType:KCJSONErrorParse
                          toError:error];
    }
    return data;
}

@end

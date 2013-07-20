//
//  NSDictionary+KCJSONSerialization.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSDictionary+KCJSONSerialization.h"
#import "KCJSONError.h"

@implementation NSDictionary (KCJSONSerialization)

- (NSString *)stringValue:(KCError *)error
{
    return [[NSString alloc] initWithData:[self dataValue:error]
                                 encoding:NSUTF8StringEncoding];
}

- (NSData *)dataValue:(KCError *)error
{
    NSError *JSONError = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:kNilOptions
                                                     error:&JSONError];
    if (JSONError)
    {
        [KCJSONError addErrorType:KCJSONErrorParse
                          toError:error];
    }
    return data;
}

@end

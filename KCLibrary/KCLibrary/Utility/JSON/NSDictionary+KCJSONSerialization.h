//
//  NSDictionary+KCJSONSerialization.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCError;

@interface NSDictionary (KCJSONSerialization)

- (NSString *)stringValue:(KCError *)error;
- (NSData *)dataValue:(KCError *)error;

@end

//
//  NSArray+KCJSONSerialization.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCError;

@interface NSArray (KCJSONSerialization)

- (NSString *)stringValue:(KCError *)error;
- (NSData *)dataValue:(KCError *)error;

@end

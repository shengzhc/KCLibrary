//
//  NSString+KCJSONSerialization.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCError;

@interface NSString (KCJSONSerialization)

- (NSMutableDictionary *)JSONDictionary:(KCError *)error;
- (NSMutableArray *)JSONArray:(KCError *)error;

@end

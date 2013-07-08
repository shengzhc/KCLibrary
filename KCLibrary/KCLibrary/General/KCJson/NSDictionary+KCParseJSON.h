//
//  NSDictionary+KCParseJSON.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCError;

@interface NSDictionary (KCParseJSON)

- (NSNumber *)booleanNumberValueForKeyPath:(NSString *)keyPath
                                     error:(KCError *)error;
- (NSString *)stringValueForKeyPath:(NSString *)keyPath
                              error:(KCError *)error;
- (NSString *)safeStringValueForKeyPath:(NSString *)keyPath
                                  error:(KCError *)error;
- (NSDecimalNumber *)decimalNumberValueForKeyPath:(NSString *)keyPath
                                            error:(KCError *)error;
- (NSDecimalNumber *)safeDecimalNumberValueForKeyPath:(NSString *)keyPath
                                                error:(KCError *)error;
- (NSMutableArray *)arrayValueForKeyPath:(NSString *)keyPath
                                   error:(KCError *)error;
- (NSMutableArray *)safeArrayValueForKeyPath:(NSString *)keyPath
                                       error:(KCError *)error;
- (NSMutableDictionary *)dictionaryValueForKeyPath:(NSString *)keyPath
                                             error:(KCError *)error;
- (NSMutableDictionary *)safeDictionaryValueForKeyPath:(NSString *)keyPath
                                                 error:(KCError *)error;

@end

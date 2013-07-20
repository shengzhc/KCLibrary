//
//  NSNumber+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (KCServices)

- (BOOL)isGreaterThan:(NSNumber *)number;

- (BOOL)isLessThan:(NSNumber *)number;

- (BOOL)isGreaterThanOrEqualTo:(NSNumber *)number;

- (BOOL)isLessThanOrEqualTo:(NSNumber *)number;

@end

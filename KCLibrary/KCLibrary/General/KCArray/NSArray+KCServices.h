//
//  NSArray+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 6/22/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (KCServices)

+ (NSArray *)array:(NSArray *)origin addingArray:(NSArray *)adding;

- (id)firstObject;
- (id)lastObject;
- (NSArray *)arrayByAddingArray:(NSArray *)arr;

@end

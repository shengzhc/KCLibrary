//
//  NSString+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KCServices)

+ (BOOL)isEmpty:(NSString *)string;

- (BOOL)isEqualIgnoringCase:(NSString *)string;

+ (NSString *)randomStringWithLength:(NSUInteger)length;

@end

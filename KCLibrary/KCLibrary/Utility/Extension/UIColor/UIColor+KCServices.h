//
//  UIColor+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KCServices)

+ (UIColor *)colorWithHex:(UInt32)hex;

+ (UIColor *)colorWithHex:(UInt32)hex
                    alpha:(CGFloat)alpha;

@end

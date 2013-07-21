//
//  UIColor+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIColor+KCServices.h"

@implementation UIColor (KCServices)

+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [UIColor colorWithHex:hex
                           alpha:1.0f];
}


+ (UIColor *)colorWithHex:(UInt32)hex
                    alpha:(CGFloat)alpha
{
    float r = ((hex & 0xFF0000) >> 16);
    float g = ((hex & 0x00FF00) >> 8);
    float b = ((hex & 0x0000FF));
    
    return [UIColor colorWithRed:r/255.0
                           green:g/255.0
                            blue:b/255.0
                           alpha:alpha];
}
@end


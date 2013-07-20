//
//  UIImage+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIImage+KCServices.h"
#import "KCGeometry.h"

@implementation UIImage (KCServices)


+ (CGGradientRef)gradientRefWithColors:(NSArray *)colors
                             locations:(NSArray *)locations
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    float *locationsPrimitiveArray = malloc([locations count] * sizeof(float));
    [locations enumerateObjectsWithOptions:NSEnumerationConcurrent
                                usingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         locationsPrimitiveArray[idx] = [obj floatValue];
     }];
    
    NSMutableArray *CGColorArray = [NSMutableArray array];
    for (UIColor *color in colors)
    {
        [CGColorArray addObject:(id)[color CGColor]];
    }
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)CGColorArray, locationsPrimitiveArray);
    CGColorSpaceRelease(colorSpace);
    free(locationsPrimitiveArray);
    
    return gradient;
}

+ (UIImage *)imageWithGradientColors:(NSArray *)colors
                           locations:(NSArray *)locations
                                size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context)
    {
        return nil;
    }
    
    CGGradientRef gradient = [self gradientRefWithColors:colors
                                               locations:locations];
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                KCPointMake(size.width*0.5, 0.0),
                                KCPointMake(size.width*0.5, size.height),
                                0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

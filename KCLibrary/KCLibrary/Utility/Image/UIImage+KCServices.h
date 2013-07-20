//
//  UIImage+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KCServices)

+ (UIImage *)imageWithGradientColors:(NSArray *)colors
                           locations:(NSArray *)locations
                                size:(CGSize)size;

@end

//
//  UIScreen+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (KCServices)

+ (BOOL)isRetina;
+ (CGFloat)screenHeigth;
+ (CGFloat)screenWidth;
+ (CGFloat)statusBarHeight;

@end

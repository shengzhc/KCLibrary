//
//  UINavigationItem+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (KCServices)

- (void)setTitleImageName:(NSString *)imageName;

- (void)setTitleImage:(UIImage *)image;

- (void)setTitle:(NSString *)title
       imageName:(NSString *)imageName;

- (void)setTitle:(NSString *)title
           image:(UIImage *)image;

@end

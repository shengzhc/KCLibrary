//
//  UIButton+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KCServices)

+ (UIButton *)buttonWithImageName:(NSString *)imageName
                           target:(id)target
                           action:(SEL)action;

+ (UIButton *)buttonWithImageName:(NSString *)imageName
                            title:(NSString *)title
                           target:(id)target
                           action:(SEL)action;
@end


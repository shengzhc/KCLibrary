//
//  UIButton+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIButton+KCServices.h"

@implementation UIButton (KCServices)


+ (UIButton *)buttonWithImageName:(NSString *)imageName
                           target:(id)target
                           action:(SEL)action
{
    return [UIButton buttonWithImageName:imageName
                                   title:nil
                                  target:target
                                  action:action];
}

+ (UIButton *)buttonWithImageName:(NSString *)imageName
                            title:(NSString *)title
                           target:(id)target
                           action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:imageName]
            forState:UIControlStateNormal];
    [button setTitle:title
            forState:UIControlStateNormal];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchDown];
    return button;
}

@end

//
//  UINavigationItem+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UINavigationItem+KCServices.h"
#import "UIImageView+KCServices.h"
#import "UILabel+KCServices.h"
#import "UIView+KCServices.h"
#import "UIScreen+KCServices.h"

@implementation UINavigationItem (KCServices)

- (void)setTitleImageName:(NSString *)imageName
{
    [self setTitleImage:[UIImage imageNamed:imageName]];
}

- (void)setTitleImage:(UIImage *)image
{
    [self setTitle:nil
             image:image];
}

- (void)setTitle:(NSString *)title
       imageName:(NSString *)imageName
{
    [self setTitle:title
             image:[UIImage imageNamed:imageName]];
}

- (void)setTitle:(NSString *)title
           image:(UIImage *)image
{
    
    UIView *view = [[UIView alloc] init];
    
    view.frame = [view alignedRectInSuperviewForSize:KCSizeMake([UIScreen screenWidth], 30)
                                              offset:CGSizeMake(0, 0)
                                             options:(KCAlignmentOptionsLeft |
                                                      KCAlignmentOptionsVerticalCenter)];
    
    if (title)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [view addSubview:imageView];
        imageView.frame = [imageView alignedRectInSuperviewForImageWithOffset:KCSizeMake(0, 0)
                                                                      options:(KCAlignmentOptionsLeft |
                                                                               KCAlignmentOptionsVerticalCenter)];
        UILabel *label = [UILabel labelWithFrame:CGRectZero
                                            text:title alignment:NSTextAlignmentLeft
                                            font:[UIFont boldSystemFontOfSize:16]
                                       textColor:[UIColor whiteColor]];
        [view addSubview:label];
        label.frame = [label alignedRectInSuperviewForSize:KCSizeMake([label labelWidthWithMaxWidth:[UIScreen screenWidth]], 30)
                                                    offset:KCSizeMake([imageView horizontalEnding] + 5, 0)
                                                   options:(KCAlignmentOptionsLeft)];
        
        view.frame = KCRectMake(view.frame.origin.x,
                                view.frame.origin.y,
                                imageView.frame.size.width + label.frame.size.width,
                                view.frame.size.height);
    }
    else
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [view addSubview:imageView];
        imageView.frame = [imageView alignedRectInSuperviewForImageWithOffset:KCSizeMake(0, 0)
                                                                      options:(KCAlignmentOptionsLeft |
                                                                               KCAlignmentOptionsVerticalCenter)];
        view.frame = KCRectMake(view.frame.origin.x,
                                view.frame.origin.y,
                                imageView.frame.size.width,
                                view.frame.size.height);
    }
    
    self.titleView = view;
}


@end

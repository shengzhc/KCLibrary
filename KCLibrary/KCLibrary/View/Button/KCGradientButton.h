//
//  KCGradientButton.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCButton.h"

@interface KCGradientButton : KCButton

- (id)initWithGradientColors:(NSArray *)gradientColors
           gradientLocations:(NSArray *)gradientLocations
                       title:(NSString *)title
                        font:(UIFont *)font
               onButtonClick:(void (^)())buttonClick;

@end

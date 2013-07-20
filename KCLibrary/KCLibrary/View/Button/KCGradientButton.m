//
//  KCGradientButton.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "KCGradientButton.h"

#import "KCUtility.h"

@interface KCGradientButton()

@property (nonatomic, copy) void (^buttonClick)();

@property (nonatomic, strong) NSArray *gradientColors;

@property (nonatomic, strong) NSArray *gradientLocations;

@end

@implementation KCGradientButton

- (id)initWithGradientColors:(NSArray *)gradientColors
           gradientLocations:(NSArray *)gradientLocations
                       title:(NSString *)title
                        font:(UIFont *)font
               onButtonClick:(void (^)())buttonClick
{
    self = [super init];
    
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        self.adjustsImageWhenDisabled = YES;
        self.titleLabel.font = font;
        self.exclusiveTouch = YES;
        
        [self addTarget:self
                 action:@selector(buttonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
        
        self.buttonClick = buttonClick;
        self.gradientColors = gradientColors;
        self.gradientLocations = gradientLocations;
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self setBackgroundImage:
     [UIImage imageWithGradientColors:self.gradientColors
                            locations:self.gradientLocations
                                 size:self.bounds.size]
                    forState:UIControlStateNormal];
}

- (void)buttonClicked:(id)sender
{
    if ([self buttonClick])
    {
        self.buttonClick();
    }
}



@end

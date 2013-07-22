//
//  KCMenuItem.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/20/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCMenuItem.h"
#import "KCUtility.h"

@interface KCMenuItem ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation KCMenuItem

- (id)initWithText:(NSString *)text
         imageName:(NSString *)imageName
{
    self = [super init];
    
    if (self)
    {
        self.backgroundColor = [UIColor kcBlueColor];
        
        self.textLabel = [UILabel labelWithTextColor:[self textLabelColor]
                                           alignment:NSTextAlignmentCenter];
        
        [self addSubview:self.imageView];
        [self addSubview:self.textLabel];
        
        self.textLabel.text = [text uppercaseString];
        [self setImage:[UIImage imageNamed:imageName]
              forState:UIControlStateNormal];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = [self.imageView alignedRectInSuperviewForSize:self.imageView.image.size
                                                                  offset:KCSizeMake(0, -10)
                                                                 options:(KCAlignmentOptionsHorizontalCenter | KCAlignmentOptionsVerticalCenter)];
    self.textLabel.frame = [self.textLabel alignedRectInSuperviewForSize:KCSizeMake([self textLabelWidth], [self textLabelHeight])
                                                                  offset:KCSizeMake(0, 10)
                                                                 options:(KCAlignmentOptionsHorizontalCenter | KCAlignmentOptionsBottom)];
}

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
#pragma mark State Method
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (highlighted)
    {
        [self setPressedState];
    }
    else
    {
        [self setDefaultState];
    }
}

- (void)setDefaultState
{
    [self updateSubviewsWithTextColor:[self textLabelColor]
                           imageColor:[self overlayImageColor]];
}

- (void)setPressedState
{
    [self updateSubviewsWithTextColor:[self pressedTextLabelColor]
                           imageColor:[self pressedOverlayImageColor]];
}

- (void)updateSubviewsWithTextColor:(UIColor *)color
                         imageColor:(UIColor *)imageColor
{
    self.textLabel.textColor = color;
    [self setImage:[[self imageForState:UIControlStateNormal]
                    imageWithOverlayColor:imageColor]
          forState:UIControlStateNormal];
}

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
#pragma mark Label Property
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
- (UIColor *)textLabelColor
{
    return [UIColor blackColor];
}

- (UIColor *)pressedTextLabelColor
{
    return [UIColor blueColor];
}

- (CGFloat)textLabelWidth
{
    return self.bounds.size.width;
}

- (CGFloat)textLabelHeight
{
    return 20;
}

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
#pragma mark Image Property
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////

- (UIColor *)overlayImageColor
{
    return nil;
}

- (UIColor *)pressedOverlayImageColor
{
    return [UIColor colorWithHex:0xCCCCCC];
}

@end

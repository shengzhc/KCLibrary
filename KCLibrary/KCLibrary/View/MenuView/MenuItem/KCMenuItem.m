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
        self.textLabel = [UILabel labelWithFrame:CGRectZero
                                            text:text
                                       alignment:NSTextAlignmentCenter
                                            font:[self textLabelFont]
                                       textColor:[self textLabelColor]];
        
        [self addSubview:self.imageView];
        
        [self addSubview:self.textLabel];
        
        self.textLabel.text = [text uppercaseString];
        
        UIImage *image = [UIImage imageWithColor:[UIColor kcBlueColor]
                                            size:KCSizeMake(1.0f, 1.0f)];
        
        [self setBackgroundImage:[image imageWithOverlayColor:[self overlayImageColor]]
              forState:UIControlStateNormal];
        
        [self setBackgroundImage:[image imageWithOverlayColor:[self pressedOverlayImageColor]]
              forState:UIControlStateHighlighted];
        
        [self setTitleColor:[self textLabelColor]
                   forState:UIControlStateNormal];
        
        [self setTitleColor:[self pressedTextLabelColor]
                   forState:UIControlStateHighlighted];
        
        
        [self setImage:[UIImage imageNamed:imageName]
              forState:UIControlStateNormal];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = [self.imageView alignedRectInSuperviewForSize:self.imageView.image.size
                                                                  offset:KCSizeMake(0, 5)
                                                                 options:(KCAlignmentOptionsHorizontalCenter | KCAlignmentOptionsTop)];
    
    self.textLabel.frame = [self.textLabel alignedRectInSuperviewForSize:KCSizeMake([self textLabelWidth], [self textLabelHeight])
                                                                  offset:KCSizeMake(0, 10)
                                                                 options:(KCAlignmentOptionsHorizontalCenter | KCAlignmentOptionsBottom)];
}

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
#pragma mark Label Property
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
- (UIFont *)textLabelFont
{
    return [UIFont boldFontWithSize:9];
}

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
    return [self.textLabel labelHeightWithMaxWidth:[self textLabelWidth]];
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

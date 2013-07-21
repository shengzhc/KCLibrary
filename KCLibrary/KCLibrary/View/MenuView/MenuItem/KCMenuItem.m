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

@end

@implementation KCMenuItem

- (id)initWithText:(NSString *)text
         imageName:(NSString *)imageName
{
    self = [super init];
    
    if (self)
    {
        self.textLabel = [UILabel labelWithTextColor:[self labelTextColor]
                                           alignment:NSTextAlignmentCenter];
        
        [self addSubview:self.imageView];
        [self addSubview:self.textLabel];
        
        self.textLabel.text = [text uppercaseString];
        [self setImage:[UIImage imageNamed:imageName]
              forState:UIControlStateNormal];
    }
    
    return self;
}

- (UIColor *)labelTextColor
{
    return [UIColor blackColor];
}

@end

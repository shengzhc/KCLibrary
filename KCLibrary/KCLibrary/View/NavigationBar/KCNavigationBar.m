//
//  KCNavigationBar.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCNavigationBar.h"
#import "KCGeometry.h"

@implementation KCNavigationBar

- (UIImage *)defaultBackgroundImage
{
    return [UIImage imageNamed:@"navigation_header"];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setBackgroundImage:[self defaultBackgroundImage]
                   forBarMetrics:UIBarMetricsDefault];
    }
    
    return self;
}

- (CGFloat)height
{
    return [[self class] height];
}

+ (CGFloat)height
{
    return 29;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return KCSizeMake([UIScreen mainScreen].bounds.size.width,
                      [self height]);
}

@end

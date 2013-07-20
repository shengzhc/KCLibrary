//
//  UIImageView+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIImageView+KCServices.h"

@implementation UIImageView (KCServices)


+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName
{
    return [[UIImageView alloc]
            initWithImageNamed:imageName];
}

- (UIImageView *)initWithImageNamed:(NSString *)imageName
{
    self = [super initWithFrame:CGRectZero];
    
    if (self)
    {
        self.image = [UIImage imageNamed:imageName];
        [self setImageViewBoundsToImage];
    }
    
    return self;
}

- (CGRect)alignedRectInSuperviewForImageWithOffset:(CGSize)offset
                                           options:(KCAlignmentOptions)options
{
    return KCSizeAlignInFrame(self.image.size,
                              [[self superview] bounds],
                              offset,
                              options);
}

- (void)setImageViewBoundsToImage
{
    self.frame = KCRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.image.size.width,
                            self.image.size.height);
}


@end

//
//  UIImageView+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCGeometry.h"

@interface UIImageView (KCServices)

+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName;

- (CGRect)alignedRectInSuperviewForImageWithOffset:(CGSize)offset
                                           options:(KCAlignmentOptions)options;

- (void)setImageViewBoundsToImage;

@end

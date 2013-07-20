//
//  UIView+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCGeometry.h"

@interface UIView (KCServices)

- (CGRect)alignedRectInSuperviewForSize:(CGSize)size
                                 offset:(CGSize)offset
                                options:(KCAlignmentOptions)options;

- (NSUInteger)horizontalEnding;
- (NSUInteger)verticalEnding;

- (UIImage *)snapshotImage;

- (void)darken:(CGFloat)darkenValue;

+ (UIWindow *)mainWindow;
- (NSNumber *)diagnoalRadius;

- (void)centerInParentHorizontally;
- (void)centerInParentVertically;
- (void)centerInParent;

@end

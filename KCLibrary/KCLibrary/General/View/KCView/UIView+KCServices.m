//
//  UIView+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIView+KCServices.h"
#import "KCGeometry.h"

#define _DARK_VIEW_TAG_ 3000

@implementation UIView (KCServices)

- (CGRect)alignedRectInSuperviewForSize:(CGSize)size
                                 offset:(CGSize)offset
                                options:(KCAlignmentOptions)options
{
    return KCSizeAlignInFrame(size, [[self superview] bounds], offset, options);
}

- (NSUInteger)horizontalEnding
{
    return self.frame.origin.x + self.frame.size.width;
}

- (NSUInteger)verticalEnding
{
    return self.frame.origin.y + self.frame.size.height;
}

- (UIImage *)snapshotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

- (UIView *)darkView
{
    for (UIView *view in self.subviews)
    {
        if (view.tag == _DARK_VIEW_TAG_)
        {
            return view;
        }
    }
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    
    view.backgroundColor = [UIColor blackColor];
    view.autoresizesSubviews = (UIViewAutoresizingFlexibleHeight |
                                UIViewAutoresizingFlexibleWidth);
    view.tag = _DARK_VIEW_TAG_;
    
    if (!view.superview)
    {
        [self insertSubview:view atIndex:0];
    }

    return view;
}

- (void)darken:(CGFloat)darkenValue
{
    self.autoresizesSubviews = YES;
    
    UIView *darkView = [self darkView];
    
    [darkView setAlpha:darkenValue];
}

+ (UIWindow *)mainWindow
{
    return [[UIApplication sharedApplication] keyWindow];
}

- (NSNumber *)diagnoalRadius
{
    return @(sqrt(pow([[UIView mainWindow] bounds].size.height/2.0, 2) +
                  pow([[UIView mainWindow] bounds].size.width/2.0, 2)));
}

- (void)centerInParentHorizontally
{
    UIView *parentView = self.superview;
    if (!parentView)
    {
        return;
    }
    
    self.frame = KCRectMake((parentView.bounds.size.width - self.frame.size.width)/2.0,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.frame.size.height);
}

- (void)centerInParentVertically
{
    UIView *parentView = self.superview;
    if (!parentView)
    {
        return;
    }
    
    self.frame = KCRectMake(self.frame.origin.x,
                            (parentView.bounds.size.height - self.frame.size.height)/2.0,
                            self.frame.size.width,
                            self.frame.size.height);
}

- (void)centerInParent
{
    [self centerInParentVertically];
    [self centerInParentHorizontally];
}



@end

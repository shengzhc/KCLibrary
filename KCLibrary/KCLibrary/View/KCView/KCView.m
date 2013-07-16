//
//  KCView.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCView.h"
#import "UIImageView+KCServices.h"

@implementation KCView
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Initialization
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:CGRectZero];
    
    if (self)
    {
        if ([self backgroundImageString])
        {
            self.backgroundImageView = [UIImageView imageViewWithImageNamed:[self backgroundImageString]];
            [self addSubview:self.backgroundImageView];
        }
    }
    return self;
}

- (id)initWithOtherView:(UIView *)parentView
{
    return [self initWithFrame:parentView.frame
                      delegate:nil];
}

- (id)initWithOtherView:(UIView *)parentView
                delegate:(id)delegate
{
    return [self initWithFrame:parentView.frame
                      delegate:delegate];
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - View life cycle
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.backgroundImageView)
    {
        self.backgroundImageView.frame = self.bounds;
    }
}


- (void)viewWillAppear { }

- (void)viewWillDisappear { }

- (void)viewDidAppear { }

- (void)viewDidDisappear { }

- (void)updateLocalizedStrings { }

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:nil
                                                  object:nil];
}

- (NSString *)backgroundImageString
{
    return nil;
}

- (CGFloat)height
{
    return self.frame.size.height;
}




@end

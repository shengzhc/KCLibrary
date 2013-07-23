//
//  SCView.m
//  KCLibraryTest
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "SCView.h"
#import "KCUtility.h"
#import "KCScrollView.h"
#import "KCTabMenuView.h"
#import "KCMenuItem.h"

@interface SCView()

@property (nonatomic, strong) KCScrollView *scrollView;
@property (nonatomic, strong) KCTabMenuView *menuView;

@end

@implementation SCView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.scrollView = [[KCScrollView alloc] initWithFrame:CGRectZero
                                                     delegate:delegate];
        
        //[self addSubview:self.scrollView];
        self.menuView = [[KCTabMenuView alloc] initWithFrame:CGRectZero
                                                    delegate:delegate];
        
        KCMenuItem *menuItem1 = [[KCMenuItem alloc] initWithText:@"Close"
                                                       imageName:@"menu_share"];
        KCMenuItem *menuItem2 = [[KCMenuItem alloc] initWithText:@"Info"
                                                       imageName:@"menu_settings"];
        KCMenuItem *menuItem3 = [[KCMenuItem alloc] initWithText:@"Logout"
                                                       imageName:@"menu_logout"];
        [self.menuView addMenuItem:menuItem1];
        [self.menuView addMenuItem:menuItem2];
        [self.menuView addMenuItem:menuItem3];
        
        [self addSubview:self.menuView];
        
        [self updateLocalizedStrings];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    self.menuView.frame = [self.menuView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 64)
                                                                offset:CGSizeMake(0, 0)
                                                               options:(KCAlignmentOptionsBottom)];
}

@end

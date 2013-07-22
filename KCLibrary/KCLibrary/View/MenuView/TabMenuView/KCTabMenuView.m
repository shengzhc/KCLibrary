//
//  KCTabMenuView.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/20/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCTabMenuView.h"
#import "KCMenuItem.h"
#import "KCUtility.h"

@interface KCTabMenuView()

@property (nonatomic, strong) NSMutableArray *menuItems;
@property (nonatomic, strong) KCMenuItem *selectedMenuItem;

@end

@implementation KCTabMenuView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.menuItems = [[NSMutableArray alloc] init];
        [self setupMenuViews];
        [self updateLocalizedStrings];
    }
    
    return self;
}

- (void)setupMenuViews
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = [self menuItemWidth];
    
    [self.menuItems enumerateObjectsUsingBlock:
     ^(KCMenuItem *menuItem, NSUInteger idx, BOOL *stop)
    {
        menuItem.frame = KCRectMake(width * idx, 0, width, [self menuItemHeight]);
    }];
    
    if (!self.selectedMenuItem)
    {
        [self attemptPerformSelector:@selector(selectDefaultMenuItem:)
                          withObject:nil
                          afterDelay:.1];
    }
}

- (void)updateLocalizedStrings
{
    
}

- (void)selectDefaultMenuItem:(KCMenuItem *)menuItem
{
    
}

//////////////////////////////////////////////
//////////////////////////////////////////////
#pragma mark MenuItem Size
//////////////////////////////////////////////
//////////////////////////////////////////////
- (CGFloat)menuItemWidth
{
    return roundf(self.frame.size.width / [self.menuItems count]);
}

- (CGFloat)menuItemHeight
{
    return self.bounds.size.height;
}

//////////////////////////////////////////////
//////////////////////////////////////////////
#pragma mark MenuItem Method
//////////////////////////////////////////////
//////////////////////////////////////////////
- (void)addMenuItem:(KCMenuItem *)menuItem
{
    if ([self.menuItems containsObject:menuItem])
    {
        return;
    }
    
    [menuItem addTarget:self
                 action:@selector(clickedMenuItem:)
       forControlEvents:UIControlEventTouchUpInside];
    
    [self.menuItems addObject:menuItem];
    [self addSubview:menuItem];
}

- (void)removeMenuItem:(KCMenuItem *)menuItem
{
    if (![self.menuItems containsObject:menuItem])
    {
        return;
    }
    
    [self.menuItems removeObject:menuItem];
    [menuItem removeFromSuperview];
}

- (void)clickedMenuItem:(KCMenuItem *)menuItem
{
    [self.delegate attemptPerformSelector:@selector(tabMenuView:clickedMenuItem:)
                              withObjects:self, menuItem, nil];
    
    [self.selectedMenuItem setDefaultState];
    self.selectedMenuItem = menuItem;
    
}

@end

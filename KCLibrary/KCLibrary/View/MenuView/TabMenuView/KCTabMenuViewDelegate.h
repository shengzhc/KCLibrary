//
//  KCTabMenuViewDelegate.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/22/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCTabMenuView;
@class KCMenuItem;

@protocol KCTabMenuViewDelegate <NSObject>

- (void)tabMenuView:(KCTabMenuView *)tabMenuView
    clickedMenuItem:(KCMenuItem *)menuItem;

@end

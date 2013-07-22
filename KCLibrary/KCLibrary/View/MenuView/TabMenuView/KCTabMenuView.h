//
//  KCTabMenuView.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/20/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCView.h"

@class KCMenuItem;

@interface KCTabMenuView : KCView

- (void)addMenuItem:(KCMenuItem *)menuItem;
- (void)removeMenuItem:(KCMenuItem *)menuItem;

@end

//
//  KCScrollView.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/20/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCView.h"
#import "KCScrollViewDelegate.h"

@interface KCScrollView : KCView < UIScrollViewDelegate, KCScrollViewDelegate, KCScrollViewDataSourceDelegate >

- (id)initWithFrame:(CGRect)frame
           delegate:(id < KCScrollViewDelegate > )delegate
         dataSource:(id < KCScrollViewDataSourceDelegate >)dataSource;

- (void)reloadScrollPageViews;

- (void)scrollToScrollPageView:(NSUInteger)index;

- (void)scrollToScrollPageView:(NSUInteger)index
                      animated:(BOOL)animated;
@end

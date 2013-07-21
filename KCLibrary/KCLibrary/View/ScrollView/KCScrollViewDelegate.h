//
//  KCScrollViewDelegate.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/20/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCScrollView;
@class KCScrollPageView;

@protocol KCScrollViewDelegate <NSObject> 

@optional

- (void)scrollView:(KCScrollView *)scrollView didScrollToPageIndex:(NSUInteger)page;
- (void)scrollView:(KCScrollView *)scrollView didScrollToView:(KCScrollPageView *)view;
- (void)scrollViewDidScroll:(KCScrollView *)scrollView;

@end

@protocol KCScrollViewDataSourceDelegate <NSObject>

@optional

- (KCScrollPageView *)scrollView:(KCScrollView *)scrollView
                pageViewForIndex:(NSUInteger)page;
- (NSUInteger)scrollViewNumberOfPages:(KCScrollView *)scrollView;

@end

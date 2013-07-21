//
//  KCScrollView.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/20/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCScrollView.h"
#import "KCUtility.h"
#import "KCScrollPageView.h"

@interface KCScrollView()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) KCScrollPageView *currentScrollPageView;

@property (nonatomic, weak) id < KCScrollViewDelegate > delegate;
@property (nonatomic, weak) id < KCScrollViewDataSourceDelegate > dataSource;

@end

@implementation KCScrollView


- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    return [self initWithFrame:frame
                      delegate:delegate
                    dataSource:delegate];
}

- (id)initWithFrame:(CGRect)frame
           delegate:(id < KCScrollViewDelegate > )delegate
         dataSource:(id < KCScrollViewDataSourceDelegate >)dataSource
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.delegate = self;
        
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.pagingEnabled = YES;
        
        [self addSubview:self.scrollView];
        self.dataSource = dataSource;
        
        [self reloadScrollPageViews];
    }
    
    return self;
}

- (void)reloadScrollPageViews
{
    NSUInteger pages = [self.dataSource scrollViewNumberOfPages:self];
    for (NSUInteger idx = 0; idx < pages; idx ++)
    {
        KCScrollPageView *scrollPageView = [self.dataSource scrollView:self
                                                      pageViewForIndex:idx];
        
        if (scrollPageView.superview == self)
        {
            [scrollPageView removeFromSuperview];
        }
        
        [self.scrollView addSubview:[self.dataSource scrollView:self
                                               pageViewForIndex:idx]];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    NSUInteger scrollPageCount = [self.dataSource
                                  scrollViewNumberOfPages:self];
    for (NSUInteger idx = 0; idx < scrollPageCount; idx++)
    {
        KCScrollPageView *scrollPageView = [self.dataSource scrollView:self
                                                      pageViewForIndex:idx];
        scrollPageView.frame = KCRectMake(idx * [self scrollPageWidth],
                                          0,
                                          [self scrollPageWidth],
                                          [self scrollPageHeight]);
    }
    
    [self.scrollView setContentSize:KCSizeMake(scrollPageCount * [self scrollPageWidth],
                                               [self scrollPageHeight])];
    
    if (!self.currentScrollPageView)
    {
        [self selectFirstScrollPageView];
    }
}

- (void)selectFirstScrollPageView
{
    [self scrollToScrollPageView:0];
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
#pragma mark - Scroll Method
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
- (void)scrollToScrollPageView:(NSUInteger)index
{
    return [self scrollToScrollPageView:index
                               animated:YES];
}

- (void)scrollToScrollPageView:(NSUInteger)index
                      animated:(BOOL)animated
{
    KCScrollPageView *scrollPageView = [self.dataSource scrollView:self
                                                  pageViewForIndex:index];
    
    if (self.currentScrollPageView == scrollPageView)
    {
        return;
    }
    
    [self.currentScrollPageView viewWillDisappear];
    [scrollPageView viewWillAppear];
    
    [self.scrollView setContentOffset:[self contentOffsetForScrollPageView:index]
                             animated:animated];
    
    [self.currentScrollPageView viewDidDisappear];
    [scrollPageView viewDidAppear];
    
    [(id)self.delegate attemptPerformSelector:@selector(scrollView:didScrollToView:)
                                   withObjects:self, scrollPageView];
    
    [(id)self.delegate attemptPerformSelector:@selector(scrollView:didScrollToPageIndex:)
                                  withObjects:self, index];
    
    self.currentScrollPageView = scrollPageView;
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
#pragma mark - UIScrollViewDelegate
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    [self scrollToScrollPageView:index];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [(id)self.delegate attemptPerformSelector:@selector(scrollViewDidScroll:)
                                   withObject:self];
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
#pragma mark - Page Size
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
- (CGFloat)scrollPageWidth
{
    return self.frame.size.width;
}

- (CGFloat)scrollPageHeight
{
    return self.frame.size.height;
}

- (CGPoint)contentOffsetForScrollPageView:(NSUInteger)index
{
    return KCPointMake([self scrollPageWidth] * index, 0);
}

@end

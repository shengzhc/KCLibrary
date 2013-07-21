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
@property (nonatomic, strong) NSMutableArray *scrollPageViews;
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
        
        self.scrollPageViews = [[NSMutableArray alloc] init];
        self.dataSource = dataSource;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    [self.scrollPageViews enumerateObjectsUsingBlock:
     ^(KCScrollPageView *scrollPageView, NSUInteger idx, BOOL *stop)
    {
        scrollPageView.frame = KCRectMake(idx * [self scrollPageWidth],
                                          0,
                                          [self scrollPageWidth],
                                          [self scrollPageHeight]);
    }];
    
    [self.scrollView setContentSize:KCSizeMake([self.scrollPageViews count] * [self scrollPageWidth],
                                               [self scrollPageHeight])];
    
    if (!self.currentScrollPageView)
    {
        [self selectFirstScrollPageView];
    }
}

- (void)selectFirstScrollPageView
{
    
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

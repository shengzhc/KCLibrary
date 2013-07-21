//
//  SCViewController.m
//  KCLibraryTest
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "SCViewController.h"
#import "SCView.h"
#import "KCLog.h"
#import "KCScrollPageView.h"

@interface SCViewController ()

@property (nonatomic, strong) NSMutableArray *pages;

@end

@implementation SCViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        KCScrollPageView *r = [[KCScrollPageView alloc] initWithFrame:CGRectZero
                                                             delegate:self];
        r.backgroundColor = [UIColor redColor];
        
        KCScrollPageView *g = [[KCScrollPageView alloc] initWithFrame:CGRectZero
                                                             delegate:self];
        g.backgroundColor = [UIColor greenColor];
        
        KCScrollPageView *b = [[KCScrollPageView alloc] initWithFrame:CGRectZero
                                                             delegate:self];
        b.backgroundColor = [UIColor blueColor];
        
        self.pages = [NSMutableArray arrayWithObjects:r, g, b, nil];
        
    }
    return self;
}

- (Class)viewClass
{
    return [SCView class];
}

- (void)scrollView:(KCScrollView *)scrollView didScrollToPageIndex:(NSUInteger)page
{
}

- (void)scrollView:(KCScrollView *)scrollView didScrollToView:(KCView *)view
{
}

- (void)scrollViewDidScroll:(KCScrollView *)scrollView
{

}

- (KCScrollPageView *)scrollView:(KCScrollView *)scrollView
                pageViewForIndex:(NSUInteger)page
{
    return [self.pages objectAtIndex:page];
}

- (NSUInteger)scrollViewNumberOfPages:(KCScrollView *)scrollView
{
    return [self.pages count];
}


@end

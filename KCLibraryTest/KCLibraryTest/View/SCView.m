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

@interface SCView()

@property (nonatomic, strong) KCScrollView *scrollView;

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
        
        [self addSubview:self.scrollView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
}

@end

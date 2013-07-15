//
//  SCViewController.m
//  KCLibraryTest
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "SCViewController.h"
#import "SCView.h"

@interface SCViewController ()

@end

@implementation SCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (Class)viewClass
{
    return [SCView class];
}

- (CGRect)viewFrame
{
    return [[UIScreen mainScreen] bounds];
}

- (void)loadView
{
    self.view = [[[self viewClass] alloc] initWithFrame:[self viewFrame]];
}

@end

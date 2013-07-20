//
//  KCView.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCView : UIView

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) KCView *activeView;

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate;

- (id)initWithOtherView:(UIView *)parentView;
- (id)initWithOtherView:(UIView *)parentView delegate:(id)delegate;

- (void)viewWillAppear;
- (void)viewWillDisappear;
- (void)viewDidAppear;
- (void)viewDidDisappear;

- (NSString *)backgroundImageString;
- (CGFloat)height;

- (void)updateLocalizedStrings;

@end

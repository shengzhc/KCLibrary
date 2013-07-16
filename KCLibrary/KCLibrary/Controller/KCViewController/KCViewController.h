//
//  KCViewController.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCViewController : UIViewController

@property (nonatomic, weak) id delegate;

- (Class)viewClass;
- (CGRect)viewFrame;

@end

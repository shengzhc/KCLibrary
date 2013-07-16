//
//  KCNavigationController.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCNavigationController : UINavigationController

@property (nonatomic, assign) BOOL forcePortrait;
@property (nonatomic, assign) BOOL forceLandscape;

+ (KCNavigationController *)modalNavigationControllerWithRootViewController:(UIViewController *)viewController;
+ (KCNavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController;

@end

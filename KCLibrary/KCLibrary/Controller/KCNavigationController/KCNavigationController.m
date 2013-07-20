//
//  KCNavigationController.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCNavigationController.h"
#import "KCNavigationBar.h"
#import "KCModalNavigationBar.h"

@interface KCNavigationController ()

@end

@implementation KCNavigationController


+ (KCNavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController
{
    return [self navigationControllerWithRootViewController:viewController
                                         navigationBarClass:[KCNavigationBar class]];
}

+ (KCNavigationController *)modalNavigationControllerWithRootViewController:(UIViewController *)viewController
{
    return [self navigationControllerWithRootViewController:viewController
                                         navigationBarClass:[KCModalNavigationBar class]];
}

+ (KCNavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController
                                                    navigationBarClass:(Class)navigationBarClass
{
    KCNavigationController *navigationController = [[KCNavigationController alloc]
                                                    initWithNavigationBarClass:navigationBarClass
                                                    toolbarClass:[UIToolbar class]];
    
    [navigationController setViewControllers:[NSArray arrayWithObject:viewController]];
    return navigationController;
}


@end

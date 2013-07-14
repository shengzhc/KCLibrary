//
//  SCViewController.m
//  Test
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "SCViewController.h"
#import "KCJSONError.h"
#import "NSDate+KCServices.h"

@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    
    NSLog(@"%@", [NSDate currentDateString]);
    NSLog(@"%@", [NSDate currentTimestamp]);
    NSLog(@"%i", [NSDate currentYear]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

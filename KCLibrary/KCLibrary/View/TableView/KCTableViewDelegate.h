//
//  KCTableViewDelegate.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/24/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCTableView;

@protocol KCTableViewDataDelegate <NSObject>

@required

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

@end

@protocol KCTableViewDelegate <NSObject>

@required

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section;

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section;


- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section;

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;

- (BOOL)tableView:(UITableView *)tableView
shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;

@end

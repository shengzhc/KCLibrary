//
//  KCTableView.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/24/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCTableView.h"
#import "KCUtility.h"

@implementation KCTableView

// custom tableview style
+ (UITableViewStyle)tableViewStyle
{
    return UITableViewStylePlain;
}

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                      style:[[self class] tableViewStyle]];
        self.tableView.delegate = self;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

//////////////////////////////////////////////
//////////////////////////////////////////////
#pragma UITableViewDataSource Delegate
//////////////////////////////////////////////
//////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate tableView:tableView
              numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate tableView:tableView
              cellForRowAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.delegate numberOfSectionsInTableView:tableView];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView
titleForFooterInSection:(NSInteger)section
{
    return nil;
}
//////////////////////////////////////////////
//////////////////////////////////////////////
#pragma UITableViewDelegate
//////////////////////////////////////////////
//////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate tableView:tableView
            heightForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{

}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate tableView:tableView
     didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (BOOL)tableView:(UITableView *)tableView
shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


@end

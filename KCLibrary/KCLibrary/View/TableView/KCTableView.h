//
//  KCTableView.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/24/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCView.h"
#import "KCTableViewDelegate.h"

@interface KCTableView : KCView < UITableViewDataSource, UITableViewDelegate >

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id < KCTableViewDelegate, KCTableViewDataDelegate > delegate;

+ (UITableViewStyle)tableViewStyle;

@end

//
//  SCView.m
//  KCLibraryTest
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "SCView.h"
#import "KCUtility.h"

@implementation SCView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
    }
    
    return self;
}

@end

//
//  NSArray+KCServices.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 6/22/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSArray+KCServices.h"

@implementation NSArray (KCServices)


- (id)firstObject
{
    if (self && self.count > 0)
    {
        return [self objectAtIndex:0];
    }
    
    return nil;
}


- (id)lastObject
{
    if (self && self.count > 0)
    {
        return [self objectAtIndex:self.count-1];
    }
    
    return nil;
}



@end

//
//  KCErrorResponse.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCErrorResponse.h"
#import "KCError.h"

@implementation KCErrorResponse

- (id)initWithResponseObject:(id)responseObject
                       error:(KCError *)error
{
    self = [super init];
    
    if (self)
    {
        self.responseObject = responseObject;
        self.error = error;
    }
    
    return self;
}

- (BOOL)isError
{
    if ([self.responseObject isKindOfClass:[KCError class]])
    {
        return YES;
    }
    
    return NO;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"responseObject: %@\n\nerror: %@",
            [self responseObject],
            [self error]];
}

@end

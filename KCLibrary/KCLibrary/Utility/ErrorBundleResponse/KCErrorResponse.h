//
//  KCErrorResponse.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCError;

@interface KCErrorResponse : NSObject

@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) KCError *error;

- (id)initWithResponseObject:(id)responseObject
                       error:(KCError *)error;

- (BOOL)isError;

@end

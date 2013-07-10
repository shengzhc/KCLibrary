//
//  KCHTTPURLResponseHandler.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCError.h"

#define KPHTTPURLResponseHandlerNotify403 @"KPHTTPURLResponseHandlerNotify403"

@interface KCHTTPURLResponseHandler : NSObject

@property (nonatomic, copy) void (^URLConnectionBlock)(NSHTTPURLResponse *, NSData *data, KCError *error);

- (id)initWithURLConnectionBlock:(void (^)(NSHTTPURLResponse *, NSData *data, KCError *error))URLConnectionBlock;

- (void)queueHandler:(NSOperationQueue *)operationQueue
            response:(NSHTTPURLResponse *)response
                data:(NSData *)data
               error:(KCError *)error;

@end

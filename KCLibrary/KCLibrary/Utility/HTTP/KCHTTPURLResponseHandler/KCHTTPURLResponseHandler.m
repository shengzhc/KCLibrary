//
//  KCHTTPURLResponseHandler.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCHTTPURLResponseHandler.h"

@implementation KCHTTPURLResponseHandler

- (id)initWithURLConnectionBlock:(void (^)(NSHTTPURLResponse *, NSData *, KCError *))URLConnectionBlock
{
    self = [super init];
    
    if (self)
    {
        self.URLConnectionBlock = URLConnectionBlock;
    }
    
    return self;
}

- (void (^)())blockWithResponse:(NSHTTPURLResponse *)response
                           data:(NSData *)data
                          error:(KCError *)error
{
    if (response.statusCode == 403)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:KPHTTPURLResponseHandlerNotify403
                                                            object:nil];
    }
    
    return ^
    {
        if (self.URLConnectionBlock)
        {
            self.URLConnectionBlock(response, data, error);
            self.URLConnectionBlock = nil;
        }
    };
}

- (void)executeBlockWithResponse:(NSHTTPURLResponse *)response
                            data:(NSData *)data
                           error:(KCError *)error
{
    [self blockWithResponse:response
                       data:data
                      error:error]();
}

- (void)queueHandler:(NSOperationQueue *)operationQueue
            response:(NSHTTPURLResponse *)response
                data:(NSData *)data
               error:(KCError *)error
{
    if (!operationQueue ||
        operationQueue == [NSOperationQueue currentQueue])
    {
        [self executeBlockWithResponse:response
                                  data:data
                                 error:error];
        return;
    }
    
    [operationQueue addOperationWithBlock:[self blockWithResponse:response
                                                             data:data
                                                            error:error]];
}


@end

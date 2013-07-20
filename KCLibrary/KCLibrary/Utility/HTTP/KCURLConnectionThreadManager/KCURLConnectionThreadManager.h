//
//  KCURLConnectionThreadManager.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCURLConnection;

@interface KCURLConnectionThreadManager : NSObject

@property (nonatomic, strong) NSOperationQueue *operationQueue;

- (id)initWithRunLoop:(NSRunLoop *)runLoop
          runDuration:(NSTimeInterval)runDuration
       operationQueue:(NSOperationQueue *)operationQueue;

- (void)scheduleDelegateMessagesForURLConnection:(KCURLConnection *)URLConnection;

@end

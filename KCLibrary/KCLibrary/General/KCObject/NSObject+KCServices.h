//
//  NSObject+KCServices.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KCServices)

- (void)attemptPerformSelector:(SEL)selector;
- (void)attemptPerformSelector:(SEL)selector
                    withObject:(id)object;

- (void)attemptPerformSelector:(SEL)selector
                   withObjects:(NSObject *)objects, ...;

- (void)attemptPerformSelectorInBackground:(SEL)selector;
- (void)attemptPerformSelectorInBackground:(SEL)selector
                                withObject:(id)object;
- (void)attemptPerformSelectorInBackground:(SEL)selector
                               withObjects:(NSObject *)objects, ...;

- (void)attemptPerformSelectorOnMainThread:(SEL)selector;
- (void)attemptPerformSelectorOnMainThread:(SEL)selector
                                withObject:(NSObject *)object;
- (void)attemptPerformSelectorOnMainThread:(SEL)selector
                               withObjects:(NSObject *)objects, ...;

@end

//
//  KCMutableURLRequest.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCMutableURLRequest : NSMutableURLRequest

+ (id)GETRequestWithURLString:(NSString *)URLString
                        token:(NSString *)token;

+ (id)PUTRequestWithURLString:(NSString *)URLString
                         body:(NSData *)body
                        token:(NSString *)token;

+ (id)POSTRequestWithURLString:(NSString *)URLString
                          body:(NSData *)body
                         token:(NSString *)token;
@end

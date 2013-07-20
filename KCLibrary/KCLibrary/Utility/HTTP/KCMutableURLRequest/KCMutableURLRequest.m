//
//  KCMutableURLRequest.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCMutableURLRequest.h"

@implementation KCMutableURLRequest


+ (NSString *)formatURLString:(NSString *)URLString
{
    URLString = [URLString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return URLString;
}

+ (id)requestWithURLString:(NSString *)URLString
                HTTPMethod:(NSString *)HTTPMethod
                      body:(NSData *)body
                     token:(NSString *)token
               contentType:(NSString *)contentType
{
    URLString = [self formatURLString:URLString];
    NSURL *URL = [NSURL URLWithString:URLString];
    
    if (!URL)
    {
        URL = [NSURL URLWithString:
               [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    NSMutableURLRequest *URLRequest = [super requestWithURL:URL];
    
    [URLRequest setHTTPMethod:HTTPMethod];
    [URLRequest setTimeoutInterval:DBL_MAX];
#warning SC Need to check
    [URLRequest setValue:token forHTTPHeaderField:@"Authorization"];
    [URLRequest setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [URLRequest setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    if ([HTTPMethod isEqualToString:@"PUT"] ||
        [HTTPMethod isEqualToString:@"POST"])
    {
        [URLRequest setHTTPBody:body];
        [URLRequest setValue:contentType forHTTPHeaderField:@"Accept"];
        [URLRequest setValue:[NSString stringWithFormat:@"%d", [body length]]
          forHTTPHeaderField:@"Content-Length"];
    }
    return URLRequest;
}

+ (id)requestWithURLString:(NSString *)URLString
                HTTPMethod:(NSString *)HTTPMethod
                      body:(NSData *)body
                     token:(NSString *)token
{
    return [self requestWithURLString:URLString
                           HTTPMethod:HTTPMethod
                                 body:body
                                token:token
                          contentType:@"application/x-www-form-urlencoded"];
}

+ (id)GETRequestWithURLString:(NSString *)URLString
                        token:(NSString *)token
{
    return [self requestWithURLString:URLString
                           HTTPMethod:@"GET"
                                 body:nil
                                token:token];
}

+ (id)PUTRequestWithURLString:(NSString *)URLString
                         body:(NSData *)body
                        token:(NSString *)token
{
    return [self requestWithURLString:URLString
                           HTTPMethod:@"PUT"
                                 body:body
                                token:token];
}

+ (id)POSTRequestWithURLString:(NSString *)URLString body:(NSData *)body token:(NSString *)token
{
    return [self requestWithURLString:URLString
                           HTTPMethod:@"POST"
                                 body:body
                                token:token];
}


@end

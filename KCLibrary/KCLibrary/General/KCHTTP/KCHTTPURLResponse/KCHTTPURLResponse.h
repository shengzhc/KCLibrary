//
//  KCHTTPURLResponse.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCErrorResponse.h"

@interface KCHTTPURLResponse : KCErrorResponse

@property (nonatomic, strong) NSNumber *statusCode;

@property (nonatomic, strong) NSData *data;

- (id)initWithStatusCode:(NSNumber *)statusCode
         acceptableCodes:(NSArray *)acceptableCodes
                    data:(NSData *)data
                   error:(KCError *)error;

- (void)validateStatusCode:(KCError *)error;
- (void)validateResponseBody:(KCError *)error;

- (NSData *)responseObject;

@end

@interface KCHTTPURLStringResponse : KCHTTPURLResponse

- (NSString *)responseObject;

@end

@interface KCHTTPURLJSONObjectResponse : KCHTTPURLResponse

- (NSMutableDictionary *)responseObject;

@end

@interface KCHTTPURLJSONArrayResponse : KCHTTPURLResponse

- (NSMutableArray *)responseObject;

@end
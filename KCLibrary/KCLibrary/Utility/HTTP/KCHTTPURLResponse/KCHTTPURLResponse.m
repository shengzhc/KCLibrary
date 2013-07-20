//
//  KCHTTPURLResponse.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/9/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCHTTPURLResponse.h"
#import "KCHTTPError.h"
#import "KCJSON.h"
#import "KCLog.h"

@interface KCHTTPURLResponse()

@property (nonatomic, strong) NSArray *acceptableCodes;

@end

@implementation KCHTTPURLResponse

- (id)initWithStatusCode:(NSNumber *)statusCode
         acceptableCodes:(NSArray *)acceptableCodes
                    data:(NSData *)data
                   error:(KCError *)error
{
    self = [super init];
    
    if (self)
    {
        self.statusCode = statusCode;
        self.acceptableCodes = acceptableCodes;
        self.data = data;
        self.error = error;
        
        [self logResponse];
    }
    
    return self;
}

- (void)logResponse
{
    KCDebugLog(@"Response string:\n%@", [[NSString alloc] initWithData:self.data
                                        encoding:NSUTF8StringEncoding]);
}

- (void)validateStatusCode:(KCError *)error
{
    if (self.acceptableCodes &&
        ![self.acceptableCodes containsObject:self.statusCode])
    {
        [KCHTTPError addErrorType:KCHTTPErrorUnexpectedStatusCode
                          toError:error];
    }
}

- (void)validateResponseBody:(KCError *)error { }

- (NSData *)responseObject
{
    return self.data;
}

@end

@interface KCHTTPURLStringResponse()

@property (nonatomic, strong) NSString *string;

@end

@implementation KCHTTPURLStringResponse

- (void)validateResponseBody:(KCError *)error
{
    [super validateResponseBody:error];
    
    self.string = [[NSString alloc] initWithData:self.data
                                        encoding:NSUTF8StringEncoding];
    
    if (!self.string)
    {
        [KCHTTPError addErrorType:KCHTTPErrorBadResponse
                          toError:error];
    }
}

- (NSString *)responseObject
{
    return self.string;
}

@end

@interface KCHTTPURLJSONObjectResponse()

@property (nonatomic, strong) NSMutableDictionary *JSONObject;

@end

@implementation KCHTTPURLJSONObjectResponse

- (void)validateResponseBody:(KCError *)error
{
    [super validateResponseBody:error];
    
    self.JSONObject = [self.data JSONObject:error];
}


- (NSMutableDictionary *)responseObject
{
    return self.JSONObject;
}

@end

@interface KCHTTPURLJSONArrayResponse()

@property (nonatomic, strong) NSMutableArray *JSONArray;

@end

@implementation KCHTTPURLJSONArrayResponse

- (void)validateResponseBody:(KCError *)error
{
    [super validateResponseBody:error];
    
    self.JSONArray = [self.data JSONArray:error];
}

- (NSMutableArray *)responseObject
{
    return self.JSONArray;
}

@end
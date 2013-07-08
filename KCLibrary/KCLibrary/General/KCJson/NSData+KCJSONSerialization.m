//
//  NSData+KCJSONSerialization.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSData+KCJSONSerialization.h"
#import "KCJSONError.h"

@implementation NSData (KCJSONSerialization)

- (NSMutableDictionary *)JSONObject:(KCError *)error
{
    NSError *JSONError = nil;
    NSMutableDictionary *JSONObject = [NSJSONSerialization JSONObjectWithData:self
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:&JSONError];

    if (!JSONObject)
    {
        [KCJSONError addErrorType:KCJSONErrorParse
                          toError:error];
    }
    else if (![JSONObject isKindOfClass:[NSDictionary class]])
    {
        [KCJSONError addErrorType:KCJSONErrorIncorrectType
                          toError:error];
    }
    
    return JSONObject;
}

- (NSMutableArray *)JSONArray:(KCError*)error
{
    NSError *JSONError = nil;
    NSMutableArray *JSONArray = [NSJSONSerialization JSONObjectWithData:self
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&JSONError];
    if (!JSONArray)
    {
        [KCJSONError addErrorType:KCJSONErrorParse
                          toError:error];
    }
    else if (![JSONArray isKindOfClass:[NSArray class]])
    {
        [KCJSONError addErrorType:KCJSONErrorIncorrectType
                          toError:error];
    }
    
    return JSONArray;
}

@end

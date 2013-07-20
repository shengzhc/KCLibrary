//
//  NSDictionary+KCParseJSON.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSDictionary+KCParseJSON.h"
#import "KCJSONError.h"

#import "NSString+KCJSONSerialization.h"

@implementation NSDictionary (KCParseJSON)

- (NSNumber *)booleanNumberValueForKeyPath:(NSString *)keyPath
                                     error:(KCError *)error
{
    id boolValue = [self valueForKeyPath:keyPath];
    
    if ([boolValue isKindOfClass:[NSNumber class]])
    {
        return @([boolValue boolValue]);
    }
    
    if ([boolValue isKindOfClass:[NSString class]])
    {
        if ([[boolValue lowercaseString] isEqualToString:@"true"])
        {
            return @YES;
        }
        else if ([[boolValue lowercaseString] isEqualToString:@"false"])
        {
            return @NO;
        }
    }

    if (error)
    {
        if (boolValue)
        {
            [KCJSONError addErrorType:KCJSONErrorIncorrectType
                              toError:error];
        }
        else
        {
            [KCJSONError addErrorType:KCJSONErrorKeyPath
                              toError:error];
        }
    }
    return @NO;
}

- (id)valueForKeyPath:(NSString *)keyPath
         expectedType:(Class)expectedType
{
    id value = [self valueForKeyPath:keyPath];
    
    if (value && (value != (id)[NSNull null]))
    {
        if ([value isKindOfClass:expectedType])
        {
            return value;
        }
    }
    return nil;
}

- (id)valueForKeyPath:(NSString *)keyPath
        expectedTypes:(NSArray *)expectedTypes
{
    for (Class expectedType in expectedTypes)
    {
        id value = [self valueForKeyPath:keyPath
                            expectedType:expectedType];
        if (value)
        {
            return value;
        }
    }
    return nil;
}

- (NSString *)stringValueForKeyPath:(NSString *)keyPath
                              error:(KCError *)error
{
    NSString *string = [self valueForKeyPath:keyPath
                                expectedType:[NSString class]];
    if (string)
    {
        return string;
    }
    
    [KCJSONError addErrorType:KCJSONErrorKeyPath
                      toError:error];
    return nil;
}

- (NSString *)safeStringValueForKeyPath:(NSString *)keyPath
                                  error:(KCError *)error
{
    NSString *string = [self valueForKeyPath:keyPath
                                expectedType:[NSString class]];
    if (string)
    {
        return string;
    }
    
    [KCJSONError addErrorType:KCJSONErrorKeyPath
                      toError:error];
    return @"";
}

- (NSDecimalNumber *)decimalNumberValueForKeyPath:(NSString *)keyPath
                                            error:(KCError *)error
{
    NSDecimalNumber *decimalNumber = [self valueForKeyPath:keyPath
                                                expectedTypes:@[[NSString class], [NSNumber class]]];
    NSString *stringValue = [decimalNumber isKindOfClass:[NSString class]] ? (NSString *)decimalNumber : decimalNumber.stringValue;

    if (!decimalNumber || !stringValue)
    {
        [KCJSONError addErrorType:KCJSONErrorKeyPath
                          toError:error];
        return nil;
    }
    
    decimalNumber = [NSDecimalNumber decimalNumberWithString:stringValue];
    if ([decimalNumber isEqual:[NSDecimalNumber notANumber]])
    {
        [KCJSONError addErrorType:KCJSONErrorKeyPath
                          toError:error];
    }
    
    return decimalNumber;
}

- (NSDecimalNumber *)safeDecimalNumberValueForKeyPath:(NSString *)keyPath
                                                error:(KCError *)error
{
    NSDecimalNumber *decimalNumber = [self decimalNumberValueForKeyPath:keyPath
                                                                  error:error];
    if (decimalNumber)
    {
        return decimalNumber;
    }
    
    return [NSDecimalNumber zero];
}

- (NSMutableArray *)arrayValueForKeyPath:(NSString *)keyPath
                                   error:(KCError *)error
{
    NSMutableArray *array = [self valueForKeyPath:keyPath
                                     expectedType:[NSArray class]];
    
    if (!array)
    {
        array = [[self valueForKeyPath:keyPath] JSONArray:nil];
    }
    
    if (array)
    {
        if (![array isKindOfClass:[NSMutableArray class]])
        {
            return [array mutableCopy];
        }
        
        return array;
    }
    
    [KCJSONError addErrorType:KCJSONErrorKeyPath
                      toError:error];
    
    return nil;
}

- (NSMutableArray *)safeArrayValueForKeyPath:(NSString *)keyPath
                                       error:(KCError *)error
{
    NSMutableArray *array = [self arrayValueForKeyPath:keyPath
                                                 error:error];
    
    if (array)
    {
        return array;
    }
    
    return [NSMutableArray array];
}

- (NSMutableDictionary *)dictionaryValueForKeyPath:(NSString *)keyPath
                                             error:(KCError *)error
{
    NSMutableDictionary *dictionary = [self valueForKeyPath:keyPath
                                               expectedType:[NSDictionary class]];

    if (!dictionary)
    {
        dictionary = [[self valueForKeyPath:keyPath] JSONDictionary:nil];
    }
    
    if (dictionary)
    {
        if (![dictionary isKindOfClass:[NSMutableDictionary class]])
        {
            return [dictionary mutableCopy];
        }
        
        return dictionary;
    }
    
    [KCJSONError addErrorType:KCJSONErrorKeyPath
                      toError:error];
    return nil;
}

- (NSMutableDictionary *)safeDictionaryValueForKeyPath:(NSString *)keyPath
                                                 error:(KCError *)error
{
    NSMutableDictionary *dictionary = [self dictionaryValueForKeyPath:keyPath
                                                                error:error];
    if (dictionary)
    {
        return dictionary;
    }
    
    return [NSMutableDictionary dictionary];
}


@end

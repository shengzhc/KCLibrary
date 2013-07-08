//
//  KCJSONError.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCError.h"

#define KCJSONErrorTypeArray @[ @"KCJSONErrorParse", @"KCJSONErrorIncorrectType", @"KCJSONErrorKeyPath"];

typedef enum
{
    KCJSONErrorParse,
    KCJSONErrorIncorrectType,
    KCJSONErrorKeyPath
} KCJSONErrorType;

@interface KCJSONError : KCError

@end

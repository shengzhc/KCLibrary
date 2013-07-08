//
//  KCJSONError.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/7/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCError.h"

#define KCJSONErrorTypeArray @[ @"KCJSONErrorParse", @"KCJSONErrorIncorrectType"];

typedef enum
{
    KCJSONErrorParse,
    KCJSONErrorIncorrectType

} KCJSONErrorType;

@interface KCJSONError : KCError

@end

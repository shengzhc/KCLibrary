//
//  KCHTTPError.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCError.h"

#define KCHTTPErrorTypeArray @[@"KCHTTPErrorRequestInformation", @"KCHTTPErrorUnexpectedStatusCode", @"KCHTTPErrorBadResponse", @"KCHTTPErrorTimeout", @"KCHTTPErrorParseForm", @"KCHTTPErrorConnectionFormation"];

typedef enum
{
    KCHTTPErrorRequestInformation,
    KCHTTPErrorUnexpectedStatusCode,
    KCHTTPErrorBadResponse,
    KCHTTPErrorTimeout,
    KCHTTPErrorParseForm,
    KCHTTPErrorConnectionFormation
} KCHTTPErrorType;

@interface KCHTTPError : KCError

@end

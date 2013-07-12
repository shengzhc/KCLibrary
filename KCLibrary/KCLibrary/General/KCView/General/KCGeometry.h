//
//  KP.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/11/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#ifndef __KCGEOMETRY_H_
#define __KCGEOMETRY_H_

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

typedef enum
{
    KCAlignmentOptionsLeft          = 1 << 0,
    KCAlignmentOptionsRight         = 1 << 1,
    KCAlignmentOptionsTop           = 1 << 2,
    KCAlignmentOptionsBottom        = 1 << 3,
    KCAlignmentOptionsHorizontalCenter = 1 << 4,
    KCAlignmentOptionsVerticalCenter    = 1 << 5
} KCAlignmentOptions;

CGRect KCSizeAlignInFrame(CGSize size, CGRect frame, CGSize offset, KCAlignmentOptions options);
CGRect KCRectAlignInFrame(CGRect rect, CGRect frame, CGSize offset, KCAlignmentOptions options);
CGFloat KCAlignmentCoordinateWithRelativeFrameHorizontal(CGRect frame, CGFloat padding, KCAlignmentOptions options);
CGFloat KCAlignmentCoordinateWithRelativeFrameVertical(CGRect frame, CGFloat padding, KCAlignmentOptions options);
CGRect KCRectWithOriginAndSize(CGPoint origin, CGSize size);
CGRect KCRectWithOriginAndSizeParameters(CGPoint origin, CGFloat width, CGFloat height);
CGRect KCRectWithOriginCoordinatesAndSize(CGFloat x, CGFloat y, CGSize size);
CGRect KCBooundsWithSize(CGSize size);
CGRect KCBoundsWithSizeParameters(CGFloat width, CGFloat height);

CGRect KPBoundsMake(CGFloat width, CGFloat height);
CGPoint KCFrameMidPoint(CGRect frame);
CGPoint KCPointMake(CGFloat x, CGFloat y);
CGSize KCSizeMake(CGFloat width, CGFloat height);
CGRect KCRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGRect KCRectOffset(CGRect rect, CGFloat x, CGFloat y);
CGRect KCRectInset(CGRect rect, CGFloat dx, CGFloat dy);


#endif
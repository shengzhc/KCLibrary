//
//  KP.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/11/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCGeometry.h"


////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Geometric Alignment
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

CGRect KCSizeAlignInFrame(CGSize size, CGRect frame, CGSize offset, KCAlignmentOptions options)
{
    CGFloat xOrigin, yOrigin;
    
    if (options & KCAlignmentOptionsLeft)
    {
        xOrigin = 0 + offset.width;
    }
    else if (options & KCAlignmentOptionsRight)
    {
        xOrigin = frame.size.width - size.width - offset.width;
    }
    else if (options & KCAlignmentOptionsHorizontalCenter)
    {
        xOrigin = (frame.size.width - size.width)/2.0;
    }
    else
    {
        xOrigin = 0 + offset.width;
    }
    
    if (options & KCAlignmentOptionsTop)
    {
        yOrigin = 0 + offset.height;
    }
    else if (options & KCAlignmentOptionsBottom)
    {
        yOrigin = frame.size.height - size.height - offset.height;
    }
    else if (options & KCAlignmentOptionsVerticalCenter)
    {
        yOrigin = (frame.size.height - size.height)/2.0;
    }
    else
    {
        yOrigin = 0 + offset.height;
    }
    
    return KCRectMake(xOrigin, yOrigin,
                      size.width, size.height);
}

CGRect KCRectAlignInFrame(CGRect rect, CGRect frame, CGSize offset, KCAlignmentOptions options)
{
    return KCSizeAlignInFrame(rect.size, frame, offset, options);
}

CGFloat KCAlignmentCoordinateWithRelativeFrameHorizontal(CGRect frame, CGFloat padding, KCAlignmentOptions options)
{
    if (options & KCAlignmentOptionsLeft)
    {
        return frame.origin.x - padding;
    }
    else if (options & KCAlignmentOptionsRight)
    {
        return frame.origin.x + frame.size.width + padding;
    }
    
    return frame.origin.x + frame.size.width + padding;
}

CGFloat KCAlignmentCoordinateWithRelativeFrameVertical(CGRect frame, CGFloat padding, KCAlignmentOptions options)
{
    if (options & KCAlignmentOptionsTop)
    {
        return frame.origin.y - padding;
    }
    else if (options & KCAlignmentOptionsBottom)
    {
        return frame.origin.y + frame.size.height + padding;
    }
    
    return frame.origin.y + frame.size.height + padding;
}

CGRect KCRectWithOriginAndSize(CGPoint origin, CGSize size)
{
    return KCRectMake(origin.x, origin.y, size.width, size.height);
}

CGRect KCRectWithOriginAndSizeParameters(CGPoint origin, CGFloat width, CGFloat height)
{
    return KCRectMake(origin.x, origin.y, width, height);
}

CGRect KCRectWithOriginCoordinatesAndSize(CGFloat x, CGFloat y, CGSize size)
{
    return KCRectMake(x, y, size.width, size.height);
}

CGRect KCBooundsWithSize(CGSize size)
{
    return KCRectMake(0, 0, size.width, size.height);
}

CGRect KCBoundsWithSizeParameters(CGFloat width, CGFloat height)
{
    return KCRectMake(0, 0, width, height);
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Geometric Construction
////////////////////////////////////////////////////////////////////////////////////////////////////////////

CGRect KPBoundsMake(CGFloat width, CGFloat height)
{
    return KCBoundsWithSizeParameters(width, height);
}

CGPoint KCFrameMidPoint(CGRect frame)
{
    return KCPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
}

CGPoint KCPointMake(CGFloat x, CGFloat y)
{
    return CGPointMake(x, y);
}

CGSize KCSizeMake(CGFloat width, CGFloat height)
{
    return CGSizeMake(width, height);
}

CGRect KCRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
#warning position does not mean pixel, and check for retina special case
    return CGRectMake(x, y, width, height);
}

CGRect KCRectOffset(CGRect rect, CGFloat x, CGFloat y)
{
    return KCRectMake(rect.origin.x + x, rect.origin.y + y,
                      rect.size.width, rect.size.height);
}

CGRect KCRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
    return CGRectInset(rect, dx, dy);
}


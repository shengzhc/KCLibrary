//
//  KCLog.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#ifndef KCLibrary_KCLog_h
#define KCLibrary_KCLog_h

#ifdef DEBUG

#define KPDebugLog(fmt, ...) NSLog((@"%s [Line %d]\n" fmt @"\n\n\n"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define KCDebugLog(...)

#endif

#define KPLog(fmt, ...) NSLog((@"%s [Line %d]" fmt @"\n\n\n"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif

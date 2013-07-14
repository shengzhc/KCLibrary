//
//  KCLocationManager.h
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/13/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface KCLocationManager : CLLocationManager < CLLocationManagerDelegate >

@property (nonatomic, assign) BOOL locationSet;

@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLLocation *lastLocation;

+ (KCLocationManager *)sharedKCLocationManager;

- (void)updateLocation;

- (void)reverseGeoLocation:(CLLocation *)location
         completionHandler:(void (^)(NSArray *, NSError *))completionHandler;

@end

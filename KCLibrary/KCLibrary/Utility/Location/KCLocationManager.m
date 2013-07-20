//
//  KCLocationManager.m
//  KCLibrary
//
//  Created by Shengzhe Chen on 7/13/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "KCLocationManager.h"

static KCLocationManager *sharedKCLocationManager = nil;

@interface KCLocationManager ()

@property (nonatomic, strong) CLGeocoder *geoCoder;

@end

@implementation KCLocationManager


+ (KCLocationManager *)sharedKCLocationManager
{
    if (!sharedKCLocationManager)
    {
        sharedKCLocationManager = [[KCLocationManager alloc] init];
    }
    return sharedKCLocationManager;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.delegate = self;
        self.geoCoder = [[CLGeocoder alloc] init];
    }
    return self;
}

- (void)reverseGeoLocation:(CLLocation *)location
         completionHandler:(void (^)(NSArray *, NSError *))completionHandler
{
    [self.geoCoder reverseGeocodeLocation:location
                        completionHandler:completionHandler];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    
    self.lastLocation = self.currentLocation;
    self.currentLocation = [locations objectAtIndex:0];

    self.locationSet = YES;
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    self.locationSet = NO;
    [self startUpdatingLocation];
}

- (void)updateLocation
{
    self.distanceFilter = kCLDistanceFilterNone;
    self.desiredAccuracy = kCLLocationAccuracyBest;
    [self setDelegate:self];
    [self startUpdatingLocation];
}


@end

//
//  ManbogiLocationManager.m
//  manbogi
//
//  Created by wonku on 2017. 5. 17..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "ManbogiLocationManager.h"
#import "ManbogiNetworkManager.h"

@implementation ManbogiLocationManager

@synthesize location,locationManager,networkManager,isPassedToNetwork;

static ManbogiLocationManager *s_manbogiLocationManager;

+ (instancetype)sharedManbogiLocationManager
{    
    if(s_manbogiLocationManager == nil)
        s_manbogiLocationManager = [ManbogiLocationManager new];
    
    return s_manbogiLocationManager;
}

-(void)initLocationManger
{
    if(self.locationManager == nil)
        self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    isPassedToNetwork = FALSE;
}

-(void)setDelegate:(id)delegate
{
    self.manboLocationDelegate = delegate;
}

-(void)startUpdateLocation
{
    isPassedToNetwork = FALSE;
    [self.locationManager requestWhenInUseAuthorization];    
    [self.locationManager startUpdatingLocation];    
}

-(void)stopUpdateLocation
{
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
    NSString *longstr = [NSString stringWithFormat:@"%g", location.coordinate.longitude];
    NSString *latistr = [NSString stringWithFormat:@"%g", location.coordinate.latitude];    

    [self stopUpdateLocation];
    
    if(!isPassedToNetwork)
        [[ManbogiNetworkManager sharedManbogiNetworkManager] initAndRequestNetwork:[NSString stringWithFormat:@"%@,%@",longstr,latistr]];
    
    isPassedToNetwork = TRUE;

}

@end

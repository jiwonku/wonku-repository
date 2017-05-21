//
//  ManbogiLocationManager.h
//  manbogi
//
//  Created by wonku on 2017. 5. 17..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ManbogiDisplayViewController.h"
#import "ManbogiNetworkManager.h"


@interface ManbogiLocationManager : NSObject <CLLocationManagerDelegate>
{
//    CLLocation *location;
    CLLocationManager *locationManager;
}

@property (assign) id manboLocationDelegate;
@property (nonatomic,strong) CLLocation *location;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) ManbogiNetworkManager *networkManager;
@property BOOL isPassedToNetwork;

+ (instancetype)sharedManbogiLocationManager;

-(void)setDelegate:(id)delegate;
-(void)initLocationManger;
-(void)startUpdateLocation;
-(void)stopUpdateLocation;

@end

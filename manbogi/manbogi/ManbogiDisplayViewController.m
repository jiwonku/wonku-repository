//
//  ManbogiDisplayViewController.m
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "ManbogiDisplayViewController.h"
#import "ManbogiStepAndDistanceCalculate.h"
#import "ManbogiLocationManager.h"
#import "ManbogiNetworkManager.h"

@interface ManbogiDisplayViewController ()

@property BOOL isManbogiRunning;

@end

@implementation ManbogiDisplayViewController

@synthesize startAndStopButton,stepCountLabel,distanceLabel,locationLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.startAndStopButton.backgroundColor = [UIColor redColor];
    [self.startAndStopButton setTintColor:[UIColor whiteColor]];
    self.isManbogiRunning = FALSE;
    
    [[ManbogiStepAndDistanceCalculate sharedManbogiStepAndDistanceCalculate] setDelegate:(id)self];
    
    [[ManbogiLocationManager sharedManbogiLocationManager] initLocationManger];
    [[ManbogiLocationManager sharedManbogiLocationManager] setDelegate:(id)self];
    
    [[ManbogiNetworkManager sharedManbogiNetworkManager] setDelegate:(id)self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)setStartAndStopButtonPress
{
    if(self.isManbogiRunning == FALSE)
    {
        self.isManbogiRunning = TRUE;
        
        self.startAndStopButton.backgroundColor = [UIColor blueColor];
        [self.startAndStopButton setTitle:@"STOP" forState:UIControlStateNormal];
        
        
        [[ManbogiLocationManager sharedManbogiLocationManager] startUpdateLocation];
        [[ManbogiStepAndDistanceCalculate sharedManbogiStepAndDistanceCalculate] startCalculateStepAndDistance];
    }
    else
    {
        self.isManbogiRunning = FALSE;
        
        self.startAndStopButton.backgroundColor = [UIColor redColor];
        [self.startAndStopButton setTitle:@"START" forState:UIControlStateNormal];
        
        [[ManbogiLocationManager sharedManbogiLocationManager] stopUpdateLocation];
        [[ManbogiStepAndDistanceCalculate sharedManbogiStepAndDistanceCalculate] stopCalculateStepCount];        
    }    
}

-(void)setDataToDisplay:(NSString*)stepCount :(NSString*)disTance
{
    self.stepCountLabel.text = stepCount;
    self.distanceLabel.text = disTance;
}

-(void)setlocatioinToDisplay:(NSString*)locationString
{
    self.locationLabel.text = locationString;
}

@end

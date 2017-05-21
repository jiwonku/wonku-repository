//
//  ManbogiStepAndDistanceCalculate.h
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "ManbogiDisplayViewController.h"

@interface ManbogiStepAndDistanceCalculate : NSObject
{
    double xPos, yPos, zPos;
    int stepCount;
    int disTance;
}


@property (assign) id manboDelegate;
@property (nonatomic, strong) CMPedometer *m_pedometer;
@property (nonatomic, strong) CMMotionActivityManager *m_cmActicityManager;
@property (nonatomic, strong) CMMotionManager *m_cmMotionManager;

+ (instancetype)sharedManbogiStepAndDistanceCalculate;

-(void)setDelegate:(id)delegate;

-(void)startCalculateStepAndDistance;
-(void)stopCalculateStepCount;


@end

//
//  ManbogiStepAndDistanceCalculate.m
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "ManbogiStepAndDistanceCalculate.h"

@implementation ManbogiStepAndDistanceCalculate

static ManbogiStepAndDistanceCalculate *s_manbogiStepAndDistanceCalculate;

+ (instancetype)sharedManbogiStepAndDistanceCalculate
{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        s_manbogiStepAndDistanceCalculate = [ManbogiStepAndDistanceCalculate new];
//    });
    
    if(s_manbogiStepAndDistanceCalculate == nil)
        s_manbogiStepAndDistanceCalculate = [ManbogiStepAndDistanceCalculate new];
    
    return s_manbogiStepAndDistanceCalculate;
}

-(void)setDelegate:(id)delegate
{
    self.manboDelegate = delegate;
}

-(void)startCalculateStepAndDistance
{
    
//    if([CMMotionActivityManager isActivityAvailable])
//    {
//        self.m_cmActicityManager = [[CMMotionActivityManager alloc] init];
//        [self.m_cmActicityManager startActivityUpdatesToQueue:[[NSOperationQueue alloc]init] withHandler:^(CMMotionActivity *activity)
//         {
//             dispatch_async(dispatch_get_main_queue(), ^{
//                 if([activity walking])
//                 {
//                     stepCount++;
//                     
//                     if([self.manboDelegate respondsToSelector:@selector(setDataToDisplay:)])
//                         [self.manboDelegate setDataToDisplay:[NSString stringWithFormat:@"%d",stepCount]];
//                 }
//             });
//             
//         }];
//    }
    
//    if([CMPedometer isStepCountingAvailable])
//    {
//        NSDate *date = [[NSDate alloc] init];
//        [self.m_pedometer queryPedometerDataFromDate:date toDate:date withHandler:^(CMPedometerData *data, NSError *error)
//         {
//             dispatch_async(dispatch_get_main_queue(), ^{
//                 
//                 if([self.manboDelegate respondsToSelector:@selector(setDataToDisplay:)])
//                     [self.manboDelegate setDataToDisplay:[NSString stringWithFormat:@"%d",[data.numberOfSteps intValue]]];
//                 
//             });
//         }];
//    }
    
//    
    self.m_cmMotionManager = [[CMMotionManager alloc]init];
    self.m_cmMotionManager.accelerometerUpdateInterval = 0.1;
    if([self.m_cmMotionManager isAccelerometerAvailable])
    {
        [self.m_cmMotionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *data, NSError *error)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 xPos = data.acceleration.x;
                 yPos = data.acceleration.y;
                 zPos = data.acceleration.z;
                 
                 if(fabs(xPos) > 1.5 || fabs(yPos) > 1.5 || fabs(zPos) > 1.5)
                 {
                     stepCount++;
                     
                     stepCount += 100;
                     
                     NSString *textDistance = [self getDistanceFromStep:stepCount];
                     
                     if([self.manboDelegate respondsToSelector:@selector(setDataToDisplay::)])
                         [self.manboDelegate setDataToDisplay:[NSString stringWithFormat:@"%d",stepCount] :textDistance];
                 }
             });
         }];
    }
    
    
    
    
}

-(void)stopCalculateStepCount
{
    [self.m_cmMotionManager stopAccelerometerUpdates];
}


-(NSString*)getDistanceFromStep:(int)a_stepCount
{
    disTance = 0;
    NSString *returnValue = nil;
    
    
    //보폭을 50cm = 1걸음 으로 책정하고 계산한다.
    //거리단위는 최소 단위가 m 임.
    
    
    disTance = a_stepCount * 0.5;
    
    
    if(disTance < 1000)
    {
        returnValue = [NSString stringWithFormat:@"%d m",disTance];
    }
    else
    {
        int quotientValue = disTance / 1000;
        int restValue = (disTance % 1000) / 100;
        
        returnValue = [NSString stringWithFormat:@"%d.%d km",quotientValue, restValue];
    }
    
    return returnValue;
}

@end

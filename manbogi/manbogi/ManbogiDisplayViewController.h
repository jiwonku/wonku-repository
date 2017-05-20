//
//  ManbogiDisplayViewController.h
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ManbogiDelegate
@optional
-(void)setDataToDisplay:(NSString*)stepCount :(NSString*)disTance;
-(void)setlocatioinToDisplay:(NSString*)locationString;
@end

@interface ManbogiDisplayViewController : UIViewController
{
    UIButton *startAndStopButton;
    
    UILabel *stepCountLabel;
    UILabel *distanceLabel;
    UILabel *locationLabel;
}

@property(nonatomic, strong) IBOutlet UIButton *startAndStopButton;

@property(nonatomic, strong) IBOutlet UILabel *stepCountLabel;
@property(nonatomic, strong) IBOutlet UILabel *distanceLabel;
@property(nonatomic, strong) IBOutlet UILabel *locationLabel;


-(IBAction)setStartAndStopButtonPress;



@end

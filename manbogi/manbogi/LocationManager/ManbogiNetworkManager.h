//
//  ManbogiNetworkManager.h
//  manbogi
//
//  Created by wonku on 2017. 5. 18..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ManbogiDisplayViewController.h"

@interface ManbogiNetworkManager : NSObject<NSURLConnectionDelegate>
{
    NSMutableData *responseData;
    NSMutableURLRequest *request;
    NSURLConnection *conn;
}

@property (assign) id manboNetworkDelegate;
@property(nonatomic,strong) NSMutableData *responseData;
@property(nonatomic,strong) NSMutableURLRequest *request;
@property(nonatomic,strong) NSURLConnection *conn;

+ (instancetype)sharedManbogiNetworkManager;

-(void)initAndRequestNetwork:(NSString *)locationInfo;
-(void)setDelegate:(id)delegate;


@end

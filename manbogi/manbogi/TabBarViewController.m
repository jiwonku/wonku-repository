//
//  TabBarViewController.m
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "TabBarViewController.h"
#import "ManbogiDisplayViewController.h"
#import "ManbogiRecordTableViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    UIStoryboard *displayStoryBoard = [UIStoryboard storyboardWithName:NSStringFromClass([ManbogiDisplayViewController class]) bundle:[NSBundle mainBundle]];
    UIStoryboard *recordStoryBoard = [UIStoryboard storyboardWithName:NSStringFromClass([ManbogiRecordTableViewController class]) bundle:[NSBundle mainBundle]];
    
    ManbogiDisplayViewController *displayViewController =
    [displayStoryBoard instantiateViewControllerWithIdentifier:NSStringFromClass([ManbogiDisplayViewController class])];
    ManbogiRecordTableViewController *recordViewController =
    [recordStoryBoard instantiateViewControllerWithIdentifier:NSStringFromClass([ManbogiRecordTableViewController class])];
    
    displayViewController.title = @"Manbogi Display";
    recordViewController.title = @"Manbogi Record";
    
    self.viewControllers = @[displayViewController, recordViewController];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.tabBar invalidateIntrinsicContentSize];
    
    CGFloat tabSize = 44.0;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(UIInterfaceOrientationIsLandscape(orientation))
    {
        tabSize = 32.0;
    }
    
//    UITabBarItem *tabBarItem = self.tabBarItem;
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIColor blackColor],NSForegroundColorAttributeName,
                                        [UIFont fontWithName:@"Helvetica" size:30.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIColor blackColor],NSForegroundColorAttributeName,
                                        [UIFont fontWithName:@"Helvetica" size:30.0], NSFontAttributeName, nil] forState:UIControlStateSelected];
    
//    self.tabBarItem = tabBarItem;
    
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = tabSize;
    
    tabFrame.origin.y = self.view.frame.origin.y;
    self.tabBar.frame = tabFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIStoryboard *tabBarStoryBoard = [UIStoryboard storyboardWithName:NSStringFromClass([TabBarViewController class]) bundle:[NSBundle mainBundle]];
    
    TabBarViewController *tabBarViewController = [tabBarStoryBoard instantiateViewControllerWithIdentifier:NSStringFromClass([TabBarViewController class])];
   
    
//    [self presentViewController:tabBarViewController animated:YES completion:nil];

    
    [self.view addSubview:tabBarViewController.view];
    [self addChildViewController:tabBarViewController];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

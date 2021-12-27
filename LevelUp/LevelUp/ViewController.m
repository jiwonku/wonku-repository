//
//  ViewController.m
//  LevelUp
//
//  Created by wonku on 10/02/2020.
//  Copyright © 2020 wonku. All rights reserved.
//

#import "ViewController.h"
#import "SubjectData.h"
#import "MinorSubjectViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainSubjectTableView;
@property (weak, nonatomic) IBOutlet UIButton *subjectAddButton;

@property (strong, nonatomic) NSArray *mainSubjectList;
@property NSInteger mainSubjectCount;

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initTableView];
    [self initMainSubjectTableView];
    
    [self.mainSubjectTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    self.mainSubjectTableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.mainSubjectTableView.rowHeight = UITableViewAutomaticDimension;
    
    // git test 1
    
    int a = 1;
    
}

- (void)initTableView
{
    [self.mainSubjectTableView setDelegate:self];
    [self.mainSubjectTableView setDataSource:self];
}

-(void)initMainSubjectTableView
{
    self.mainSubjectList = [SubjectData sharedSubjectData].subjectArray;
    self.mainSubjectCount = self.mainSubjectList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mainSubjectCount;
    
    // git test 3
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [_mainSubjectTableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = @"1";

    return cell;
}

- (IBAction)subjectAddButtonTouched:(id)sender
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MinorSubjectViewController *minorSubjectViewController = nil;
    
    NSString * storyboardName = @"MinorSubject";
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    minorSubjectViewController = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([MinorSubjectViewController class])];
    minorSubjectViewController.modalPresentationStyle = UIModalPresentationFullScreen;

    [self presentViewController:minorSubjectViewController animated:YES completion:nil];
}




@end

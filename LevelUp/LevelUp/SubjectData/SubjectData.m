//
//  SubjectData.m
//  LevelUp
//
//  Created by wonku on 10/02/2020.
//  Copyright © 2020 wonku. All rights reserved.
//

#import "SubjectData.h"

@implementation SubjectData

+ (instancetype)sharedSubjectData
{
    static SubjectData * s_optionData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_optionData = [SubjectData new];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"SubjectData" ofType:@"plist"];
        s_optionData.subjectArray = [NSArray arrayWithContentsOfFile:path];
        NSAssert(s_optionData.subjectArray != nil, @"[required] SubjectData.plist");
      
    });
    
    return s_optionData;
}


- (BOOL)updateData:(NSArray*)optionData
{
    if(optionData && [optionData count] > 0)
    {
        self.subjectArray = optionData;
        NSAssert(self.subjectArray != nil, @"[required] valid optionData");
        return YES;
    }
    return NO;
}

@end

//
//  SubjectData.h
//  LevelUp
//
//  Created by wonku on 10/02/2020.
//  Copyright © 2020 wonku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubjectData : NSObject

+ (instancetype)sharedSubjectData;

@property (strong, nonatomic) NSArray *subjectArray;

@end

NS_ASSUME_NONNULL_END

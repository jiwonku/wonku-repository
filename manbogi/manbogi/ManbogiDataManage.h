//
//  DataManage.h
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ManbogiDataManage : NSObject
{
    sqlite3 *dataBase;
}

-(void)createDB;
-(void)removeAllDataFromDB;
-(NSString*)getDataPath;


@end

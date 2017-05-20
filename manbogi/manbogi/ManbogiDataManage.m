//
//  DataManage.m
//  manbogi
//
//  Created by wonku on 2017. 5. 15..
//  Copyright © 2017년 wonku. All rights reserved.
//

#import "ManbogiDataManage.h"

@implementation ManbogiDataManage


-(void)createDB
{
    int ret = sqlite3_open([[self getDataPath]UTF8String], &dataBase);
    
    if(ret != SQLITE_OK)
        sqlite3_close(dataBase);
    
    NSString *createDBSQL = @"Create table if not exists manbogi(date text,steps text,distance text);";
    ret = sqlite3_exec(dataBase, [createDBSQL UTF8String], NULL, NULL, NULL);
    
    if(ret == SQLITE_OK)
        sqlite3_close(dataBase);
    else
        sqlite3_close(dataBase);
}
-(void)removeAllDataFromDB
{
    int ret = sqlite3_open([[self getDataPath] UTF8String], &dataBase);
    
    if(ret != SQLITE_OK)
        sqlite3_close(dataBase);
    
    NSString *removeDataSQL = @"DELETE from manbogi";
    
    sqlite3_stmt *sql_stmt;
    sqlite3_prepare_v2(dataBase, [removeDataSQL UTF8String], -1, &sql_stmt, nil);
    
    ret = sqlite3_step(sql_stmt);
    
    if(ret != SQLITE_OK)
        sqlite3_close(dataBase);
    
    sqlite3_close(dataBase);
    
}
-(NSString*)getDataPath
{
    NSString *tempPath = [NSString stringWithFormat:@"%@/Documents/%@", NSHomeDirectory(),@"data.sqlite3"];
    return  tempPath;
}


@end

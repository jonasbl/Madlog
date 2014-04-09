//
//  Database.m
//  foodLog
//
//  Created by Jonas Lauritsen on 19/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "Database.h"
#import <sqlite3.h>

@implementation Database

- (NSString *) filePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[path objectAtIndex:0] stringByAppendingPathComponent:@"MadLog.db"];
}


- (void) openDB
{
    //Åben databasen
    if (sqlite3_open([[self filePath] UTF8String], &madLog) != SQLITE_OK)
    {
        sqlite3_close(madLog);
        NSAssert(0, @"Database failed to open");
    }
    else
    {
        NSLog(@"Database opened");
    }
    
    
    
    char *error;
    //Create product if table don't already exists
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS product(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(50) NOT NULL, type VARCHAR(50) NOT NULL, fat VARCHAR(20), calories INTEGER, carbohydrates INTEGER, grams INTEGER, protein INTEGER, sugar INTEGER);"];
    
    if (sqlite3_exec(madLog, [sql UTF8String], NULL, NULL, &error) != SQLITE_OK)
    {
        sqlite3_close(madLog);
        NSAssert(0, @"Could not create table");
    }
    else
    {
        NSLog(@"Table created");
    }
    
    
    
}

@end

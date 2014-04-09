//
//  Database.h
//  foodLog
//
//  Created by Jonas Lauritsen on 19/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Database : NSObject <UITextFieldDelegate>
{
    sqlite3 *madLog;
}

- (void) openDB;
- (NSString *) filePath;

@end

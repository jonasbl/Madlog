//
//  ViewChosenProductViewController.m
//  foodLog
//
//  Created by Jonas Lauritsen on 22/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "ViewChosenProductViewController.h"
#import "FoodTableViewController.h"
#import <sqlite3.h>

@interface ViewChosenProductViewController ()

@end

@implementation ViewChosenProductViewController

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
}



- (void)viewDidLoad
{
    [self openDB];
    [super viewDidLoad];
    
    self.nameLabel.text = self.nameText;
    
    
    NSString *sql = [NSString stringWithFormat:@"SELECT name, type, fat, calories, carbohydrates, grams, protein, sugar  FROM product WHERE name ='%@'", self.nameText];
    sqlite3_stmt *statement;
    
    
    const char *query_stmt = [sql UTF8String];
    
    if (sqlite3_prepare_v2(madLog, query_stmt, -1, &statement, NULL) == SQLITE_OK)
    {
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            NSString *nameText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
            self.nameLabel.text = nameText;
            
            NSString *typeText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
            self.typeOfProductLabel.text = typeText;
            
            NSString *fatText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
            self.fatLabel.text = fatText;
            
            NSString *calorieText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
            self.calorieLabel.text = calorieText;
            
            NSString *carbohydrateText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
            self.carbohydrateLabel.text = carbohydrateText;
            
            NSString *gramText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
            self.gramLabel.text = gramText;
            
            NSString *proteinText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
            self.proteinLabel.text = proteinText;
            
            NSString *sugarText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
            self.sugarLabel.text = sugarText;
            
        }
        else
        {
            
            self.nameLabel.text = @"";
            self.typeOfProductLabel.text = @"";
            self.gramLabel.text = @"";
            self.calorieLabel.text = @"";
            self.sugarLabel.text = @"";
            self.proteinLabel.text = @"";
            self.carbohydrateLabel.text = @"";
            self.fatLabel.text = @"";
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(madLog);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



@end

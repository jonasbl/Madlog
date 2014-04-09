//
//  ProfileViewController.m
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self openDB];
    [super viewDidLoad];
    
    self.emailLabel.text = self.emailText;
    
    
    NSString *sql = [NSString stringWithFormat:@"SELECT name, age, height, weight, email FROM user WHERE email ='%@'", self.emailText];
    sqlite3_stmt *statement;
    
    
    const char *query_stmt = [sql UTF8String];
    
    if (sqlite3_prepare_v2(madLog, query_stmt, -1, &statement, NULL) == SQLITE_OK)
    {
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            NSString *nameText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
            self.nameLabel.text = nameText;
            
            NSString *ageText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
            self.ageLabel.text = ageText;
            
            NSString *heightText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
            self.heightLabel.text = heightText;
            
            NSString *weightText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
            self.weightLabel.text = weightText;
            
            NSString *emailText = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
            self.emailLabel.text = emailText;

        }
        else
        {
            self.nameLabel.text = @"";
            self.ageLabel.text = @"";
            self.heightLabel.text = @"";
            self.weightLabel.text = @"";
            self.emailLabel.text = @"";
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

@end

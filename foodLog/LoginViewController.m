//
//  LoginViewController.m
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "LoginViewController.h"
#import "ProfileViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toTheApp"])
    {
        UITabBarController *tbc = segue.destinationViewController;
        UINavigationController *nc = (UINavigationController *)[[tbc viewControllers] objectAtIndex:0];
        ProfileViewController *pvc = (ProfileViewController *)[[nc viewControllers] objectAtIndex:0];
        
        pvc.emailText = self.emailTextField.text;
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"toTheApp"])
    {
        // look for the user
        [self findUser];
        
        
        NSArray *aou = self.arrayOfUsers;
        
        // if the email and the password is not found
        if (![aou containsObject:self.emailTextField.text] && ![aou containsObject:self.passwordTextField.text])
        {
            
            UIAlertView *notPermitted = [[UIAlertView alloc]
                                         initWithTitle:@"Alert"
                                         message:@"Wrong mail or password, please try again"
                                         delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
            [notPermitted show];
            return NO;
        }
        // if found
        else
        {
            return YES;
        }
    }

    // by default perform the segue transition
    return YES;
}

-(void)findUser
{
    [self viewDidLoad];
    [self openDB];
    
    // Search for email and password in database
    
    NSString *sql = [NSString stringWithFormat:@"SELECT email, password FROM user WHERE email = '%@' AND password = '%@'", self.emailTextField.text, self.passwordTextField.text];
    
    sqlite3_stmt *statement;
    
    const char *query_stmt = [sql UTF8String];
    
    if (sqlite3_prepare_v2(madLog, query_stmt, -1, &statement, nil)== SQLITE_OK)
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            char *email=(char *) sqlite3_column_text(statement, 0);
        
            char *password=(char *) sqlite3_column_text(statement, 1);
        
        
            NSString *emailStr=[[NSString alloc] initWithUTF8String:email];
        
            NSString *passwordStr=[[NSString alloc] initWithUTF8String:password];
            
            
            NSString *aStr = [[NSString alloc]initWithFormat:@"%@",emailStr];
            
            NSString *bStr = [[NSString alloc]initWithFormat:@"%@",passwordStr];
        
       
            [self.arrayOfUsers addObject:aStr];
            [self.arrayOfUsers addObject:bStr];
        }
        sqlite3_finalize(statement);
        
        // To see what we found
        NSLog(@"Her kommer det :  %@", self.arrayOfUsers);
    }
}



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
    //Create user if table don't already exists
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS user(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(50) NOT NULL, age INTEGER NOT NULL, height INTEGER NOT NULL, weight INTEGER NOT NULL, email VARCHAR(50) UNIQUE NOT NULL, password VARCHAR(50) NOT NULL);"];
    
    if (sqlite3_exec(madLog, [sql UTF8String], NULL, NULL, &error) != SQLITE_OK)
    {
        sqlite3_close(madLog);
        NSAssert(0, @"Could not create table");
    }
    else
    {
        NSLog(@"Table created");
    }
    
    //Create product if table don't already exists
    NSString *sqlProduct = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS product(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(50) NOT NULL, type VARCHAR(50) NOT NULL, fat VARCHAR(20), calories INTEGER, carbohydrates INTEGER, grams INTEGER, protein INTEGER, sugar INTEGER);"];
    
    if (sqlite3_exec(madLog, [sqlProduct UTF8String], NULL, NULL, &error) != SQLITE_OK)
    {
        sqlite3_close(madLog);
        NSAssert(0, @"Could not create table");
    }
    else
    {
        NSLog(@"Table created");
    }
  
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[_emailTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    
    
}

- (void)viewDidLoad
{
    [self openDB];
    self.arrayOfUsers = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    
    // Add a user
    NSString *sql = [NSString stringWithFormat:@"INSERT OR IGNORE INTO user('name', 'age', 'height', 'weight', 'email', 'password') VALUES ('Jonas', '23', '182', '76', 'a@a.dk', '200')"];
    
    char *error;
    
    if (sqlite3_exec(madLog, [sql UTF8String], NULL, NULL, &error) !=
        SQLITE_OK) {
        sqlite3_close(madLog);
        NSAssert(0, @"Could not update table");
    }
    else
    {
        NSLog(@"Table updated");
        sqlite3_close(madLog);
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

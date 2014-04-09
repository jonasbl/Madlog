//
//  LoginViewController.h
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface LoginViewController : UIViewController
{
    sqlite3 *madLog;
}

@property NSMutableArray *arrayOfUsers;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (void) findUser;
- (NSString *) filePath;
- (void) openDB;

@end

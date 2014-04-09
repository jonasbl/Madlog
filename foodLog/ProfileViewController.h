//
//  ProfileViewController.h
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ProfileViewController : UIViewController
{
    sqlite3 *madLog;
}


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@property (strong, nonatomic) NSString *emailText;


- (NSString *) filePath;
- (void) openDB;

@end

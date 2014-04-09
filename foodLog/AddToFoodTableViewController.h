//
//  AddToFoodTableViewController.h
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import <sqlite3.h>

@interface AddToFoodTableViewController : UIViewController <UITextFieldDelegate>
{
    sqlite3 *madLog;
}

@property (weak, nonatomic) IBOutlet UITextField *typeOfProductText;
@property (weak, nonatomic) IBOutlet UITextField *nameOfTheProductText;
@property (weak, nonatomic) IBOutlet UITextField *gramsTextField;
@property (weak, nonatomic) IBOutlet UITextField *caloriesTextField;
@property (weak, nonatomic) IBOutlet UITextField *sugarTextField;
@property (weak, nonatomic) IBOutlet UITextField *proteinTextField;
@property (weak, nonatomic) IBOutlet UITextField *carbohydratesTextField;
@property (weak, nonatomic) IBOutlet UITextField *fatTextField;



@property Product *product;

- (void) openDB;
- (NSString *) filePath;

@end

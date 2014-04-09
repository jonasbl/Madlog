//
//  ViewChosenProductViewController.h
//  foodLog
//
//  Created by Jonas Lauritsen on 22/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewChosenProductViewController : UIViewController
{
    sqlite3 *madLog;

}

@property (weak, nonatomic) IBOutlet UILabel *typeOfProductLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gramLabel;
@property (weak, nonatomic) IBOutlet UILabel *calorieLabel;
@property (weak, nonatomic) IBOutlet UILabel *sugarLabel;
@property (weak, nonatomic) IBOutlet UILabel *proteinLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbohydrateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatLabel;

@property (nonatomic, strong) NSString *nameText;

//@property NSMutableArray *theChosenProduct;

- (NSString *) filePath;
- (void) openDB;

@end

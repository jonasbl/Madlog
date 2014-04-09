//
//  FoodTableViewController.h
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Product.h"

@interface FoodTableViewController : UITableViewController
{
    sqlite3 *madLog;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property NSMutableArray *nameOfAllTheProducts;


- (IBAction)changeProductButton:(id)sender;

- (NSString *) filePath;
- (void) openDB;



@end

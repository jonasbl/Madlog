//
//  FoodTableViewController.m
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <sqlite3.h>
#import "FoodTableViewController.h"
#import "AddToFoodTableViewController.h"
#import "ViewChosenProductViewController.h"
#import "Product.h"


@interface FoodTableViewController ()



@end

@implementation FoodTableViewController

- (IBAction)changeProductButton:(id)sender
{
    [self viewDidLoad];
    
    if (self.segmentController.selectedSegmentIndex == 0)
    {
        NSString *sql = [NSString stringWithFormat:@"SELECT name FROM product WHERE type = 'Breakfast'"];
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare(madLog, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *name = (char *) sqlite3_column_text(statement, 0);
                NSString *nameStr = [[NSString alloc]initWithUTF8String:name];
                
                NSString *str = [[NSString alloc]initWithFormat:@"%@",nameStr];
                [self.nameOfAllTheProducts addObject:str];
            }
        }
    }
    
    if (self.segmentController.selectedSegmentIndex == 1)
    {
        NSString *sql = [NSString stringWithFormat:@"SELECT name FROM product WHERE type = 'Dinner'"];
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare(madLog, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *name = (char *) sqlite3_column_text(statement, 0);
                NSString *nameStr = [[NSString alloc]initWithUTF8String:name];
                
                NSString *str = [[NSString alloc]initWithFormat:@"%@",nameStr];
                [self.nameOfAllTheProducts addObject:str];
            }
        }
    }
    
    if (self.segmentController.selectedSegmentIndex == 2)
    {
        NSString *sql = [NSString stringWithFormat:@"SELECT name FROM product WHERE type = 'Fastfood'"];
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare(madLog, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *name = (char *) sqlite3_column_text(statement, 0);
                NSString *nameStr = [[NSString alloc]initWithUTF8String:name];
                
                NSString *str = [[NSString alloc]initWithFormat:@"%@",nameStr];
                [self.nameOfAllTheProducts addObject:str];
            }
        }
    }
    
    if (self.segmentController.selectedSegmentIndex == 3)
    {
        NSString *sql = [NSString stringWithFormat:@"SELECT name FROM product WHERE type = 'Snack'"];
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare(madLog, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *name = (char *) sqlite3_column_text(statement, 0);
                NSString *nameStr = [[NSString alloc]initWithUTF8String:name];
                
                NSString *str = [[NSString alloc]initWithFormat:@"%@",nameStr];
                [self.nameOfAllTheProducts addObject:str];
            }
        }
    }
    
    if (self.segmentController.selectedSegmentIndex == 4)
    {
        NSString *sql = [NSString stringWithFormat:@"SELECT name FROM product WHERE type = 'Drinks'"];
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare(madLog, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statement)==SQLITE_ROW)
            {
                char *name = (char *) sqlite3_column_text(statement, 0);
                NSString *nameStr = [[NSString alloc]initWithUTF8String:name];
                
                NSString *str = [[NSString alloc]initWithFormat:@"%@",nameStr];
                [self.nameOfAllTheProducts addObject:str];
            }
        }
    }
    
    
    [self.tableView reloadData];
    
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
}


- (IBAction)unwindToFoodTableView:(UIStoryboardSegue *)segue
{
    [self viewDidLoad];
    [self.tableView reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showTheProduct"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewChosenProductViewController *vcpvc = segue.destinationViewController;
        
        vcpvc.nameText = [self.nameOfAllTheProducts objectAtIndex:indexPath.row];
        
    }
}

- (void)viewDidLoad
{
    self.nameOfAllTheProducts = [[NSMutableArray alloc] init];
    [self openDB];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // The number of sections in my tableView.
    return  1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // The number of rows in the Section
    return [self.nameOfAllTheProducts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the cell in my table
    static NSString *CellIdentifier = @"ListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // add product to the cell
    cell.textLabel.text = [self.nameOfAllTheProducts objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
 

@end

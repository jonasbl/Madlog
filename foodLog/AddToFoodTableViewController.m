//
//  AddToFoodTableViewController.m
//  foodLog
//
//  Created by Jonas Lauritsen on 28/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "AddToFoodTableViewController.h"
#import "Product.h"
#import "sqlite3.h"

@interface AddToFoodTableViewController ()



@end

@implementation AddToFoodTableViewController

- (NSString *) filePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[path objectAtIndex:0] stringByAppendingPathComponent:@"MadLog.db"];
}


- (void) openDB
{
    //Open database
    
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



- (IBAction)saveTheProductToTheDatabase:(id)sender
{
    NSString *name = _nameOfTheProductText.text;
    NSString *type = _typeOfProductText.text;
    NSString *fat = _fatTextField.text;
    int calories = [_caloriesTextField.text integerValue];
    int carbohydrates = [_carbohydratesTextField.text integerValue];
    int grams = [_gramsTextField.text integerValue];
    int protein = [_proteinTextField.text integerValue];
    int sugar = [_sugarTextField.text integerValue];
    
    NSArray *pType = [Product productType];
    
    // if the product name is not longer then 1
    if (_nameOfTheProductText.text && !_nameOfTheProductText.text.length >1)
    {
        UIAlertView *notPermitted = [[UIAlertView alloc]
                                     initWithTitle:@"Alert"
                                     message:@"The name is too short, try again"
                                     delegate:nil
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil];
        [notPermitted show];
    }
    // if the product type doesn't exist the typed text
    if (![pType containsObject:_typeOfProductText.text])
    {
        UIAlertView *notPermitted = [[UIAlertView alloc]
                                     initWithTitle:@"Alert"
                                     message:@"The type has to be either, Breakfast, Dinner, Snack, Fastfood or Drinks"
                                     delegate:nil
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil];
        [notPermitted show];
        
    }
    // if the amount of calories is 0
    if (_caloriesTextField.text && !_caloriesTextField.text.length > 0)
    {
        UIAlertView *notPermitted = [[UIAlertView alloc]
                                     initWithTitle:@"Alert"
                                     message:@"There must be a number of calories"
                                     delegate:nil
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil];
        [notPermitted show];
    }
    // else add product and reset the textfields
    else
    {
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO product('name', 'type', 'fat', 'calories', 'carbohydrates', 'grams', 'protein', 'sugar') VALUES ('%@', '%@', '%@', '%d', '%d', '%d', '%d', '%d');", name, type, fat, calories, carbohydrates, grams, protein, sugar];
        
            char *error;
        
        if (sqlite3_exec(madLog, [sql UTF8String], NULL, NULL, &error) !=
                SQLITE_OK) {
                sqlite3_close(madLog);
                NSAssert(0, @"Could not update table");
            
        }
        else
        {
            NSLog(@"Table updated");
        }
    
            _nameOfTheProductText.text = @"";
            _typeOfProductText.text = @"";
            _fatTextField.text = @"";
            _caloriesTextField.text = @"";
            _carbohydratesTextField.text = @"";
            _gramsTextField.text = @"";
            _proteinTextField.text = @"";
            _sugarTextField.text = @"";
           
    }
    
}

- (void)viewDidLoad
{
    // open database
    [self openDB];
    
    
    [super viewDidLoad];
    
    
    _fatTextField.delegate = self;
    _carbohydratesTextField.delegate = self;
    _proteinTextField.delegate = self;
}


- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    // Move fatTextField up
    if (textField == _fatTextField)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _fatTextField.frame = CGRectMake(_fatTextField.frame.origin.x, (_fatTextField.frame.origin.y - 110.0), _fatTextField.frame.size.width, _fatTextField.frame.size.height);
        [UIView commitAnimations];
    }

    // Move proteinTextField up
    else if (textField == _proteinTextField)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _proteinTextField.frame = CGRectMake(_proteinTextField.frame.origin.x, (_proteinTextField.frame.origin.y - 35.0), _proteinTextField.frame.size.width, _proteinTextField.frame.size.height);
        [UIView commitAnimations];
    }
    
    // Move carbohydratesTextField up
    else if (textField == _carbohydratesTextField)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _carbohydratesTextField.frame = CGRectMake(_carbohydratesTextField.frame.origin.x, (_carbohydratesTextField.frame.origin.y - 75.0), _carbohydratesTextField.frame.size.width, _carbohydratesTextField.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    // Move fatTextField down
    if (textField == _fatTextField)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _fatTextField.frame = CGRectMake(_fatTextField.frame.origin.x, (_fatTextField.frame.origin.y + 110.0), _fatTextField.frame.size.width, _fatTextField.frame.size.height);
        [UIView commitAnimations];
    }
    
    // Move proteinTextField down
    else if (textField == _proteinTextField)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _proteinTextField.frame = CGRectMake(_proteinTextField.frame.origin.x, (_proteinTextField.frame.origin.y + 35.0), _proteinTextField.frame.size.width, _proteinTextField.frame.size.height);
        [UIView commitAnimations];
    }
    
    // Move carbohydratesTextField down
    else if (textField == _carbohydratesTextField)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        _carbohydratesTextField.frame = CGRectMake(_carbohydratesTextField.frame.origin.x, (_carbohydratesTextField.frame.origin.y + 75.0), _carbohydratesTextField.frame.size.width, _carbohydratesTextField.frame.size.height);
        [UIView commitAnimations];
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // close keyboard when touches outside a textfield
    
	[_typeOfProductText resignFirstResponder];
    [_nameOfTheProductText resignFirstResponder];
    [_gramsTextField resignFirstResponder];
    [_caloriesTextField resignFirstResponder];
    [_sugarTextField resignFirstResponder];
    [_proteinTextField resignFirstResponder];
    [_carbohydratesTextField resignFirstResponder];
    [_fatTextField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

@end

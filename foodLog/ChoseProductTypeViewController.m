//
//  ChoseProductTypeViewController.m
//  foodLog
//
//  Created by Jonas Lauritsen on 22/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "FoodTableViewController.h"
#import "ChoseProductTypeViewController.h"

@interface ChoseProductTypeViewController ()

@end

@implementation ChoseProductTypeViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)BreakfastProducts:(UIButton *)sender
{
    breakfastWasClicked = YES;
}
@end

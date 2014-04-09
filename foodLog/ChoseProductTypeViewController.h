//
//  ChoseProductTypeViewController.h
//  foodLog
//
//  Created by Jonas Lauritsen on 22/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoseProductTypeViewController : UIViewController
{
    BOOL breakfastWasClicked;
}

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *collectionOfProductTypeButtons;

@property (weak, nonatomic) IBOutlet UIButton *BreakfastButton;
@property (weak, nonatomic) IBOutlet UIButton *DinnerButton;
@property (weak, nonatomic) IBOutlet UIButton *FastfoodButton;
@property (weak, nonatomic) IBOutlet UIButton *SnacksButton;
@property (weak, nonatomic) IBOutlet UIButton *DrinksButton;

- (IBAction)BreakfastProducts:(UIButton *)sender;

@end

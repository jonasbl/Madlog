//
//  Food.h
//  foodLog
//
//  Created by Jonas Lauritsen on 24/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic) NSInteger calories;
@property (nonatomic) double fat;
@property (nonatomic) NSInteger carbohydrates;
@property (nonatomic) NSInteger grams;
@property (nonatomic) NSInteger protein;
@property (nonatomic) NSInteger sugar;



@end

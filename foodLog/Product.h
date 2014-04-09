//
//  Product.h
//  foodLog
//
//  Created by Jonas Lauritsen on 03/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *fat;

@property (nonatomic) NSInteger calories;
@property (nonatomic) NSInteger carbohydrates;
@property (nonatomic) NSInteger grams;
@property (nonatomic) NSInteger protein;
@property (nonatomic) NSInteger sugar;

+(NSArray *) productType;

@end

//
//  User.h
//  foodLog
//
//  Created by Jonas Lauritsen on 24/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *password;
@property (nonatomic) NSInteger age;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger weight;
@property (nonatomic) NSString *email;

@end

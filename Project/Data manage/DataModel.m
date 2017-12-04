//
//  Data Model.m
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)init
{
    // init value in data of datamodel
    self = [super init];
    if (self) {
        self.expense = [NSMutableArray array];
        Catalogs *food = [[Catalogs alloc] init];
        food.kind = @"Food";
		food.mostExpensive = 0;
		food.cheapest = 0;
		food.total = 0;
		food.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *entertainment = [[Catalogs alloc] init];
        entertainment.kind = @"Entertainment";
		entertainment.mostExpensive = 0;
		entertainment.cheapest = 0;
		entertainment.total = 0;
		entertainment.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *social = [[Catalogs alloc] init];
        social.kind = @"Social";
		social.mostExpensive = 0;
		social.cheapest = 0;
		social.total = 0;
		social.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *study = [[Catalogs alloc] init];
        study.kind = @"Study";
		study.mostExpensive = 0;
		study.cheapest = 0;
		study.total = 0;
		study.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *shopping = [[Catalogs alloc] init];
        shopping.kind = @"Shopping";
		shopping.mostExpensive = 0;
		shopping.cheapest = 0;
		shopping.total = 0;
		shopping.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *gift = [[Catalogs alloc] init];
        gift.kind = @"Gift";
		gift.mostExpensive = 0;
		gift.cheapest = 0;
		gift.total = 0;
		gift.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *dailyLife = [[Catalogs alloc] init];
        dailyLife.kind = @"Daily Life";
		dailyLife.mostExpensive = 0;
		dailyLife.cheapest = 0;
		dailyLife.total = 0;
		dailyLife.percentage = 0;
        
        self.expense = [NSMutableArray array];
        Catalogs *grocery = [[Catalogs alloc] init];
        grocery.kind = @"Grocery";
		grocery.mostExpensive = 0;
		grocery.cheapest = 0;
		grocery.total = 0;
		grocery.percentage = 0;
        
        [self.expense addObject: food];//0
        [self.expense addObject: entertainment];//1
        [self.expense addObject: social];//2
        [self.expense addObject: study];//3
        [self.expense addObject: shopping];//4
        [self.expense addObject: gift];//5
        [self.expense addObject: dailyLife];//6
        [self.expense addObject: grocery];//7
        
    }
    return self;
}

@end

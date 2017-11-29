//
//  Catalogs.h
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalogs : NSObject

@property (strong, nonatomic) NSString *kind;
@property float mostExpensive;
@property float cheapest;
@property float total;
@property float percentage;

@end

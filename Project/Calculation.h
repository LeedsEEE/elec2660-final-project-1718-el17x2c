//
//  Calculation.h
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstViewController.h"
#import "DataModel.h"

@interface Calculation : NSObject

@property NSInteger row;
@property float outcome;

- (void) mostExpensive;
- (void) cheapest;
- (void) total;
- (void) percentage;

@end

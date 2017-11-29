//
//  Calculation.m
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "Calculation.h"

// use global data and totalOut
extern DataModel *data;
extern float totalOut;

@implementation Calculation

// calculate most expensive one
- (void) mostExpensive{
    
	Catalogs *temp = data.expense [self.row];
	temp.mostExpensive = MAX(temp.mostExpensive, self.outcome); // MAX function will return the bigger value between two
	data.expense [self.row] = temp;
    
}

// calcutate cheapest one
- (void) cheapest{
    
	Catalogs *temp = data.expense [self.row];
	temp.cheapest = MIN(temp.cheapest, self.outcome);// MIN function will return the smaller value between two
	data.expense [self.row] = temp;
    
}

// calculate total
- (void) total {
    
	Catalogs *temp = data.expense [self.row];
	temp.total += self.outcome;
	data.expense [self.row] = temp;
    
}

// calculate percentage
- (void) percentage{
    
    for (int i = 0; i < data.expense.count; i++) {
        
        Catalogs *temp = data.expense[i];
        temp.percentage = 100 * temp.total/totalOut;
        
    }
	
}

@end

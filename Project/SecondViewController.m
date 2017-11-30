//
//  SecondViewController.m
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

// use the data in tableindex and data
extern NSInteger tableIndex;
extern DataModel *data;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // give temp a value which is the number of tableindex th in the data expense
    Catalogs *temp = data.expense [tableIndex];
    
    // let the labels show the results
    self.kindLabel.text = [NSString stringWithFormat:@"%@", temp.kind];
    self.cheapestLabel.text = [NSString stringWithFormat:@"Cheapest: £ %.2f", temp.cheapest];
    self.mostExpensiveLabel.text = [NSString stringWithFormat:@"MostExpensive: £ %.2f", temp.mostExpensive];
    self.precentageLabel.text = [NSString stringWithFormat:@"Percentage:%.0f%%", temp.percentage];
    self.totalLabel.text = [NSString stringWithFormat:@"Total: £ %.2f", temp.total];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showChart:(id)sender {
}
@end

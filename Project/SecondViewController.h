//
//  SecondViewController.h
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "FirstViewController.h"
#import "DataModel.h"
#import "Catalogs.h"

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *kindLabel;
@property (weak, nonatomic) IBOutlet UILabel *mostExpensiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *cheapestLabel;
@property (weak, nonatomic) IBOutlet UILabel *precentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)showChart:(id)sender;

@end



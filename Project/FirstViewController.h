//
//  FirstViewController.h
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculation.h"
#import "DataModel.h"

@interface FirstViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *outcomeLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *kindPicker;

@property (weak, nonatomic) IBOutlet UITextField *incomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *outcomeTextField;

- (IBAction)confirmButton:(UIButton *)sender;

@property float income;
@property float outcome;
@property float balance;

@property NSArray *allKind;

-(void) checkIncome;
-(void) checkOutcome;

@end


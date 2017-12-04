//
//  FirstViewController.m
//  Project
//
//  Created by Sean_CXY on 2017/11/14.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end
// I tried to use userdefault function and data transmit through views but they did not work
// Found and learn this method from internet resources
// global variable reference: http://blog.csdn.net/u010963948/article/details/48464297
//                            http://blog.csdn.net/ichenwin/article/details/54849712

DataModel *data;
Calculation *calculate;
//global totalOut can be used in other classes by extern function
float totalOut;

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.kindPicker.delegate = self;
    //self.kindPicker.dataSource = self;
    
    //Ceate a global data, which let me can save and use the data in other classes
    // method init
    data = [[DataModel alloc] init];
    calculate = [[Calculation alloc]init];
    
    //array to store the kinds of expenses
    self.allKind = [NSArray arrayWithObjects:@"Food",
                    @"Entertainment",
                    @"Social",
                    @"Study",
                    @"Shopping",
                    @"Gift",
                    @"Daily Life",
                    @"Grocery", nil];
    
    // pickview init
    self.kindPicker.delegate = self;
    self.kindPicker.dataSource = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark picker view delegate method
// set title for the pickview
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *coordinate = [[NSString alloc]init];
    coordinate = self.allKind [row];
    
    return coordinate;
    
}

#pragma mark picker view data source method
// set rows and componts for the pickview
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 8;
    
}

#pragma mark textfield delegate
// press return to return
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

//press background to return
- (IBAction)backGroundPressed:(id)sender {
    
    if ([self.outcomeTextField isFirstResponder]) {
        [self.outcomeTextField resignFirstResponder];
    }
    
    if ([self.incomeTextField isFirstResponder]) {
        [self.incomeTextField resignFirstResponder];
    }
    
}

#pragma mark confirm button
// button action
- (IBAction)confirmButton:(UIButton *)sender {
    [self checkIncome]; // use function checkincome, send message to self
    [self checkOutcome];// use function checkoutcome, send message to self
    
    // init the text in the textfield
    self.incomeTextField.text = @"";
    self.outcomeTextField.text = @"";
}



-(void) checkIncome {
    self.income = [self.incomeTextField.text floatValue]; // get value from the textfield
    if (self.income != 0) { // calculate balance when income is entered by the user
        self.balance += self.income;
        // output balance
        self.balanceLabel.text = [NSString stringWithFormat: @"Balance: £ %.2f", self.balance];
        //NSLog(@"%.2f",self.balance);
    }
}


-(void) checkOutcome { // calculate balance when outcome is entered by the user
    self.outcome = [self.outcomeTextField.text floatValue]; // get value from the textfield
    if (self.outcome != 0) {
        self.balance -= self.outcome;
        totalOut += self.outcome;
        // output balance
        self.balanceLabel.text = [NSString stringWithFormat: @"Balance: £ %.2f", self.balance];
        //NSLog(@"%.2f",self.balance);
        
        // pickview selectrowincomponent function
        NSInteger row=[self.kindPicker selectedRowInComponent:0];
        
        // define the row and outcome in each row in class calculation
        calculate.row = row;
        calculate.outcome = self.outcome;
        
        // run the functions in the calculation class
        [calculate total];
        [calculate cheapest];
        [calculate mostExpensive];
        [calculate percentage];
    }
}


@end

//
//  ViewController.m
//  Project
//
//  Created by Sean_CXY on 2017/11/29.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

/*
 I did not write most of the part myself. Most of the codes are form internet resources.
 https://www.youtube.com/watch?v=C8hCmTA_7cE
 https://codeplacer.wordpress.com/2015/01/22/how-to-draw-piechart-in-objective-c-using-xypiechart-library/
 http://blog.csdn.net/qq_30513483/article/details/51694104
 http://www.codeweblog.com/ios%E7%BB%98%E5%88%B6%E9%A5%BC%E5%9B%BE-xypiechart/
 http://code.cocoachina.com/view/136370
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static inline UIColor *GetRandomUIColor()
{
    CGFloat r = arc4random() % 255;
    CGFloat g = arc4random() % 255;
    CGFloat b = arc4random() % 255;
    UIColor * color = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1.0f];
    return color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pieview = [[PieView alloc] initWithFrame:CGRectMake(50, 75,self.view.bounds.size.width-150, self.view.bounds.size.width-150)];
    self.pieview.delegate = self;
    self.pieview.datasource = self;
    
    [self.vv addSubview:self.pieview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(CGFloat)centerCircleRadius
{
    return 0;
}

-(int)numberOfSlicesInPieChartView:(PieView *)pieChartView
{
    return 2;
}
-(UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.width-50 + 30*index,200, 30)];
    UIColor *color = GetRandomUIColor();
    label.backgroundColor = color;
    [self.view addSubview:label];
    return color;
}
-(double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index
{
    double value = 0.0;
    if(index % 2 == 0){
        value = 25;
    }else{
        value = 75;
    }
    
    return value;
}

@end



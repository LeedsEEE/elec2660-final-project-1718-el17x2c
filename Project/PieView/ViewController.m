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
 http://blog.csdn.net/smileZhangli/article/details/78601625?locationNum=10&fps=1
 http://www.codeweblog.com/ios%E7%BB%98%E5%88%B6%E9%A5%BC%E5%9B%BE-xypiechart/
 http://code.cocoachina.com/view/136370
 http://blog.csdn.net/likendsl/article/details/7595905
 http://www.jianshu.com/p/ad8eed568ff4
 */

#import "ViewController.h"

@interface ViewController ()

@end

// use global variable data
extern DataModel *data;

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
    
    //size of pie chart
    self.pieview = [[PieView alloc] initWithFrame:CGRectMake(50, 75,self.view.bounds.size.width-150, self.view.bounds.size.width-150)];
    self.pieview.delegate = self;
    self.pieview.datasource = self;
    
    [self.vv addSubview:self.pieview]; 
    
    // define array to be used in table
    self.allkind = [NSArray arrayWithObjects:@"Food",
                                             @"Entertainment",
                                             @"Social",
                                             @"Study",
                                             @"Shopping",
                                             @"Gift",
                                             @"Daily Life",
                                             @"Grocery", nil];
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
    return 50;
}

// how many sections in pie chart
-(int)numberOfSlicesInPieChartView:(PieView *)pieChartView
{
    return 8;
}

//input data in table
-(UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
    float value;
    
    Catalogs *temp = data.expense[index];
    
    value = temp.percentage;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.width-50 + 30*index,200, 30)];
    UIColor *color = GetRandomUIColor();
    label.backgroundColor = color;
    
    label.text = [NSString stringWithFormat:@"%@: %.2f%%", self.allkind[index],value];
    
    [self.view addSubview:label];
    return color;
}

//input data in pie chart
-(double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index
{
    float value;
    
    Catalogs *temp = data.expense[index];
    
    value = temp.percentage;
    
    return value;
}

@end



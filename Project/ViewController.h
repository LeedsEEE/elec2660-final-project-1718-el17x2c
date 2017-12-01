//
//  ViewController.h
//  Project
//
//  Created by Sean_CXY on 2017/11/29.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//
// take from https://codeplacer.wordpress.com/2015/01/22/how-to-draw-piechart-in-objective-c-using-xypiechart-library/
#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface ViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource>

@property (strong,nonatomic) IBOutlet XYPieChart *pieChart;


@end

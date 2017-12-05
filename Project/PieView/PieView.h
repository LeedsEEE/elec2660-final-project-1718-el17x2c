//
//  PieView.h
//  Project
//
//  Created by Sean_CXY on 2017/11/29.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//


/*
 I did not write all this part myself. Most of the codes are form internet resources, and I modified them.
 http://www.doc88.com/p-2327732815078.html (most important one)
 https://codeplacer.wordpress.com/2015/01/22/how-to-draw-piechart-in-objective-c-using-xypiechart-library/
 http://blog.csdn.net/smileZhangli/article/details/78601625?locationNum=10&fps=1
 http://blog.csdn.net/yj229201093/article/details/51539198
 http://code.cocoachina.com/view/136370
 http://blog.csdn.net/likendsl/article/details/7595905
 http://www.jianshu.com/p/ad8eed568ff4
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PieView;
@protocol PieViewDelegate <NSObject>

- (CGFloat)centerCircleRadius;

@end



@protocol PieViewDataSource <NSObject>

@required
- (int)numberOfSlicesInPieChartView:(PieView *)pieChartView; // how many slices in pie chart
- (double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index; // value in pie chart
- (UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index; // pie chart color

@optional
- (NSString*)pieChartView:(PieView *)pieChartView titleForSliceAtIndex:(NSUInteger)index; // kind name in table

@end

@interface PieView : UIView
@property (nonatomic, assign) id <PieViewDataSource> datasource; // pieviewdatasource
@property (nonatomic, assign) id <PieViewDelegate> delegate; // pieviewdelegate
-(void)reloadData;

@end


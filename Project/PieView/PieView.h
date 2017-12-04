//
//  PieView.h
//  Project
//
//  Created by Sean_CXY on 2017/11/29.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//


/*
 I did not write the part myself. Most of the codes are form internet resources.
 https://www.youtube.com/watch?v=C8hCmTA_7cE
 https://codeplacer.wordpress.com/2015/01/22/how-to-draw-piechart-in-objective-c-using-xypiechart-library/
 http://blog.csdn.net/qq_30513483/article/details/51694104
 http://www.codeweblog.com/ios%E7%BB%98%E5%88%B6%E9%A5%BC%E5%9B%BE-xypiechart/
 http://code.cocoachina.com/view/136370
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PieView;
@protocol PieViewDelegate <NSObject>

- (CGFloat)centerCircleRadius;

@end



@protocol PieViewDataSource <NSObject>

@required
- (int)numberOfSlicesInPieChartView:(PieView *)pieChartView;
- (double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index;
- (UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index;

@optional
- (NSString*)pieChartView:(PieView *)pieChartView titleForSliceAtIndex:(NSUInteger)index;

@end

@interface PieView : UIView
@property (nonatomic, assign) id <PieViewDataSource> datasource;
@property (nonatomic, assign) id <PieViewDelegate> delegate;
-(void)reloadData;

@end


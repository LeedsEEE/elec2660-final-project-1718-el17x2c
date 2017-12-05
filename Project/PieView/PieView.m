//
//  PieView.m
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

#import "PieView.h"

@implementation PieView

@synthesize delegate;
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.5f);
        self.layer.shadowRadius = 1.9f;
        self.layer.shadowOpacity = 0.9f;
    }
    return self;
}

-(void)reloadData
{
    [self setNeedsDisplay];
}

// draw the pie chart
- (void)drawRect:(CGRect)rect
{
    // the part set circle properties
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat theHalf = rect.size.width/2;
    CGFloat lineWidth = theHalf;
    if ([self.delegate respondsToSelector:@selector(centerCircleRadius)])
    {
        lineWidth -= [self.delegate centerCircleRadius];
        NSAssert(lineWidth <= theHalf, @"wrong circle radius"); // make sure the linewidth is smaller than radius
    }
    CGFloat radius = theHalf-lineWidth/2;
    
    // set center of pie chart
    CGFloat centerX = theHalf;
    CGFloat centerY = rect.size.height/2;
    
    // the part draw the pie chart
    double sum = 0.0f;
    int slicesCount = [self.datasource numberOfSlicesInPieChartView:self]; // set number of slices
    
    for (int i = 0; i < slicesCount; i++)
    {
        sum += [self.datasource pieChartView:self valueForSliceAtIndex:i]; // set data calculate the sum value
    }
    
    float startAngle = - M_PI_2;
    float endAngle = 0.0f;
    
    for (int i = 0; i < slicesCount; i++)
    {
        double value = [self.datasource pieChartView:self valueForSliceAtIndex:i];
        
        endAngle = startAngle + M_PI*2*value/sum;
        CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, false);// draw an arc
        
        UIColor  *drawColor = [self.datasource pieChartView:self colorForSliceAtIndex:i]; // fill color of piechart
        
        CGContextSetStrokeColorWithColor(context, drawColor.CGColor);
        CGContextSetLineWidth(context, lineWidth); // set the line width
        CGContextStrokePath(context); // linegraph
        startAngle += M_PI*2*value/sum;
    }
}


@end


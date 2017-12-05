//
//  ViewController.h
//  Project
//
//  Created by Sean_CXY on 2017/11/29.
//  Copyright © 2017年 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieView.h"
#import "FirstViewController.h"
#import "DataModel.h"
#import "Catalogs.h"

@interface ViewController : UIViewController <PieViewDataSource, PieViewDelegate>

@property (strong, nonatomic) UIView *vv;
@property (strong, nonatomic) PieView *pieview;

@property NSArray *allkind;

@end

//
//  GZPieChartView.h
//  GZPieChartView
//
//  Created by armada on 2016/11/14.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZPieChartView : UIView

/**
 * @ 饼状图各部分百分比
 */
@property(nonatomic,strong) NSArray<NSNumber *> *portions;

/**
 * @ 饼状图各部分颜色
 */
@property(nonatomic,strong) NSArray<UIColor *> *colors;

/**
 * @ 分割线颜色,默认是黑色
 */
@property(nonatomic,strong) UIColor *separatorLineColor;

/**
 * @ 线条宽,默认是0
 */
@property(nonatomic,assign) CGFloat lineWidth;

/**
 * @ 绘制半径,默认是0
 */
@property(nonatomic,assign) CGFloat drawRadius;

@end

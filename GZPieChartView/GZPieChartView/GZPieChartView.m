//
//  GZPieChartView.m
//  GZPieChartView
//
//  Created by armada on 2016/11/14.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import "GZPieChartView.h"


@interface GZPieChartView()

@property(nonatomic,strong) NSMutableArray<NSNumber *> *caculatedPercentages;

@end

@implementation GZPieChartView

#pragma mark - Initialization and lazy loading

//各部分数值
- (NSArray *)portions {
    
    if(!_portions) {
        _portions = [NSArray array];
    }
    return _portions;
}

//各部分颜色
- (NSArray *)colors {
    
    if(!_colors) {
        _colors = [NSArray array];
    }
    return _colors;
}

//各部分分割线
- (UIColor *)separatorLineColor {
    
    if(!_separatorLineColor) {
        _separatorLineColor = [UIColor blackColor];
    }
    return _separatorLineColor;
}

//各部分所占百分比
- (NSMutableArray *)caculatedPercentages {
    
    if(!_caculatedPercentages) {
        _caculatedPercentages = [NSMutableArray array];
    }
    return _caculatedPercentages;
}

//线条宽
- (CGFloat)lineWidth {
    
    return _lineWidth;
}

//绘制半径
- (CGFloat)drawRadius {
    
    return _drawRadius;
}

#pragma mark - drawRect
- (void)drawRect:(CGRect)rect {
    
    [self.caculatedPercentages removeAllObjects];
    
    if(self.portions.count>0 && self.portions>0){
        
        float total = 0;
        
        for(int i=0;i<self.portions.count;i++) {
            
            total += [self.portions objectAtIndex:i].floatValue;
        }
        
        for(int i=0;i<self.portions.count;i++) {
            
            float percent = [self.portions objectAtIndex:i].floatValue/total;
            [self.caculatedPercentages addObject:[NSNumber numberWithFloat:percent]];
        }
        
        float currentArch = -M_PI_2;
        
        for(int i=0;i<self.portions.count;i++) {
            
            float archSpacing = 0.05;
            //绘制分割线
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2) radius:self.drawRadius startAngle:currentArch endAngle:currentArch+archSpacing clockwise:YES];
            currentArch += archSpacing;
            path.lineWidth = self.lineWidth;
            path.lineCapStyle = kCGLineCapButt;
            [self.separatorLineColor set];
            [path stroke];
            
            //绘制各部分数据占比区域
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2)  radius:self.drawRadius startAngle:currentArch endAngle:currentArch+M_PI*2*([self.caculatedPercentages objectAtIndex:i].floatValue)-archSpacing clockwise:YES];
            path.lineWidth = self.lineWidth;
            path.lineCapStyle = kCGLineCapButt;
            
            if(i<self.colors.count) {
                [[self.colors objectAtIndex:i] set];
            }else {
                [[UIColor blackColor] set];
            }
            [path stroke];
            
            currentArch += M_PI*2*([self.caculatedPercentages objectAtIndex:i].floatValue)-archSpacing;
        }
        
    }
}

@end

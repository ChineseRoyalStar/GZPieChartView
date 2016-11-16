//
//  ViewController.m
//  GZPieChartView
//
//  Created by armada on 2016/11/14.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import "ViewController.h"

#import "GZPieChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GZPieChartView *pieChart = [[GZPieChartView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    pieChart.center = self.view.center;
    pieChart.portions = @[@100,@200,@300];
    pieChart.colors = @[[UIColor redColor],
                        [UIColor yellowColor],
                        [UIColor cyanColor]];
    pieChart.separatorLineColor = [UIColor whiteColor];
    pieChart.lineWidth = 80.0f;
    pieChart.drawRadius = 80.0f;
    pieChart.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pieChart];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

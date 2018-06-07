//
//  ViewController.m
//  YogaKitDemo
//
//  Created by lining on 2018/4/2.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import "ViewController.h"
#import <YogaKit/UIView+Yoga.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+ttet.h"
#import "UIImageView+rrrrrrrr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)ddd {
   
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    // 测试图片 url
    NSString *testUrl = @"http://bos.pgzs.com/itunesimg/31/351091731/c2dcc1bc41fa08a3a7ab3877e878b7a1_512x512bb.114x114-75.jpg";
    
    float viewWidth = 57;
    
    /*** 要设置圆形的 imageview */
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(70, 100, viewWidth, viewWidth);
    [imageView xf_setCircleHeaderWithUrl:testUrl placeholder:@"icon"];
    [self.view addSubview:imageView];
    
    /*** 要设置圆角型的 imageview */
    UIImageView *imageViewTwo = [[UIImageView alloc] init];
    imageViewTwo.frame = CGRectMake(150, 100, viewWidth, viewWidth);
    [imageViewTwo xf_setRectHeaderWithUrl:testUrl placeholder:@"icon"];
    [self.view addSubview:imageViewTwo];
    
    /*** 要设置六边形的 imageview */
    UIImageView *imageViewThree = [[UIImageView alloc] init];
    imageViewThree.frame = CGRectMake(230, 100, viewWidth, viewWidth);
    [imageViewThree xf_setSixSideHeaderWithUrl:testUrl placeholder:@"icon"];
    [self.view addSubview:imageViewThree];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self ddd];
}



-(void)dodoViews
{
    
    [self.view configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        layout.alignItems = YGAlignCenter;
    }];
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        // 4
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(320);
        layout.height = YGPointValue(80);
        layout.marginTop = YGPointValue(100);
        
        layout.padding =  YGPointValue(10);//设置了全部子项目的填充值
    }];
    
    UIView *child1 = [[UIView alloc]init];
    child1.backgroundColor = [UIColor redColor];
    [child1 configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.marginRight = YGPointValue(10);
    }];
    
    
    [contentView addSubview:child1];
    
    
    UIView *child2 = [[UIView alloc]init];
    child2.backgroundColor = [UIColor blueColor];
    [child2 configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.flexGrow = 1;
        layout.height = YGPointValue(20);
        layout.alignSelf = YGAlignCenter;
        
    }];
    
    
    [contentView addSubview:child2];
    
    
    [self.view addSubview:contentView];
    
    [self.view.yoga applyLayoutPreservingOrigin:YES];
    
    
}
@end

//
//  UIView+ggg.m
//  YogaKitDemo
//
//  Created by biubiu on 2018/6/8.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import "UIView+ggg.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>

#import "UIImage+ttet.h"
@implementation UIView (ggg)
/**
 *  圆形
 */
- (void)xf_setCircleHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    // 让占位图片也是圆的
//    UIImage *placeholderImage = [UIImage xf_circleImage:placeholderName];
//    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//        if (image == nil) return;
//
//        //self.image = [image xf_circleImage];
//    }];
}

/**
 *  方形,也可以设置圆角
 */
- (void)xf_setRectHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
//    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//        if (image == nil) return;
//
//        self.layer.cornerRadius = 8.0;
//        self.clipsToBounds = YES;
//    }];
}

/**
 *  六边形
 */
- (void)xf_setSixSideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
//    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//        if (image == nil) return;
//
//        // 这个宽高要跟外面你要设置的 imageview 的宽高一样
//        CGFloat imageViewWH = 57;
//
//        UIBezierPath * path = [UIBezierPath bezierPath];
//        path.lineWidth = 2;
//
//        [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2), (imageViewWH / 4))];
//        [path addLineToPoint:CGPointMake((imageViewWH / 2), 0)];
//        [path addLineToPoint:CGPointMake(imageViewWH - ((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2)), (imageViewWH / 4))];
//        [path addLineToPoint:CGPointMake(imageViewWH - ((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2)), (imageViewWH / 2) + (imageViewWH / 4))];
//        [path addLineToPoint:CGPointMake((imageViewWH / 2), imageViewWH)];
//        [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2), (imageViewWH / 2) + (imageViewWH / 4))];
//        [path closePath];
//        CAShapeLayer * shapLayer = [CAShapeLayer layer];
//        shapLayer.lineWidth = 2;
//        shapLayer.path = path.CGPath;
//        shapLayer.strokeColor = [UIColor redColor].CGColor;
//
//        shapLayer.borderColor = [UIColor whiteColor].CGColor;
//        self.layer.mask = shapLayer;
//    }];
}

/**
 *  平行四边形
 */
- (void)xf_setPingxing4SideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
//    
//    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        if (image == nil) return;
//        
//        // 这个宽高要跟外面你要设置的 imageview 的宽高一样
//        CGFloat imageViewWH = 57;
//        CGFloat ww = CGRectGetWidth(self.frame);
//        CGFloat hh = CGRectGetHeight(self.frame);
//        CGFloat pai = M_1_PI / 180 * 60;
//        UIBezierPath * path = [UIBezierPath bezierPath];
//        path.lineWidth = 2;
//        
//        CGFloat x,y;
//        x = hh/tan(M_PI / 180 * 60);
//        y = 0;
//        CGPoint point1 = CGPointMake(x, y);
//        CGPoint point2 = CGPointMake(x+ww, y);
//        CGPoint point3 = CGPointMake(ww, hh);
//        CGPoint point4 = CGPointMake(0, hh);
//        CGPoint point5 = point1;
//        
//        
//        [path moveToPoint:point1];
//        [path addLineToPoint:point2];
//        [path addLineToPoint:point3];
//        [path addLineToPoint:point4];
//        //[path moveToPoint:point5];
//        
//        [path closePath];
//        CAShapeLayer * shapLayer = [CAShapeLayer layer];
//        shapLayer.lineWidth = 2;
//        shapLayer.path = path.CGPath;
//        shapLayer.strokeColor = [UIColor redColor].CGColor;
//        
//        shapLayer.borderColor = [UIColor whiteColor].CGColor;
//        self.layer.mask = shapLayer;
//    }];
    
    
}

/**
 *  平行四边形
 */
- (void)xf_setPoooingxing4SideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
 
    CGFloat ww = CGRectGetWidth(self.frame);
    CGFloat hh = CGRectGetHeight(self.frame);
    CGFloat pai = M_PI / 180 * 60;
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 1;
 
    
    CGFloat x,y;
    x = hh/tan(pai)+1;
    y = 0;
    CGPoint point1 = CGPointMake(x, y);
    CGPoint point2 = CGPointMake(x+ww/2.0f, y);
    CGPoint point3 = CGPointMake(ww/2.0f, hh);
    CGPoint point4 = CGPointMake(1, hh);
    CGPoint point5 = point1;
    
    
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    
    [path closePath];
    CAShapeLayer * shapLayer = [CAShapeLayer layer];
    shapLayer.lineWidth = 2;
    shapLayer.path = path.CGPath;
    shapLayer.strokeColor = [UIColor redColor].CGColor;
    shapLayer.fillColor = [UIColor greenColor].CGColor;
    shapLayer.borderColor = [UIColor redColor].CGColor;
    shapLayer.borderWidth = 2;
    shapLayer.lineCap = @"square";
    self.layer.mask = shapLayer;
    
    
     UIBezierPath * path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:point2];
    [path2 addLineToPoint:point3];
    
    [path2 closePath];
    CAShapeLayer * shapLayer2 = [CAShapeLayer layer];
    shapLayer2.lineWidth = 2;
    shapLayer2.path = path2.CGPath;
    shapLayer2.strokeColor = [UIColor redColor].CGColor;
    shapLayer2.fillColor = [UIColor greenColor].CGColor;
    shapLayer2.borderColor = [UIColor redColor].CGColor;
    shapLayer2.borderWidth = 2;
    
     [self.layer addSublayer:shapLayer2];
}
@end

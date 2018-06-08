//
//  UIImageView+rrrrrrrr.m
//  YogaKitDemo
//
//  Created by biubiu on 2018/6/7.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import "UIImageView+rrrrrrrr.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+ttet.h"
@implementation UIImageView (rrrrrrrr)
/**
 *  圆形
 */
- (void)xf_setCircleHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    // 让占位图片也是圆的
    UIImage *placeholderImage = [UIImage xf_circleImage:placeholderName];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        if (image == nil) return;

        self.image = [image xf_circleImage];
    }];
}

/**
 *  方形,也可以设置圆角
 */
- (void)xf_setRectHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        if (image == nil) return;

        self.layer.cornerRadius = 8.0;
        self.clipsToBounds = YES;
    }];
}

/**
 *  六边形
 */
- (void)xf_setSixSideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        if (image == nil) return;

        // 这个宽高要跟外面你要设置的 imageview 的宽高一样
        CGFloat imageViewWH = 57;

        UIBezierPath * path = [UIBezierPath bezierPath];
        path.lineWidth = 2;
        
        [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2), (imageViewWH / 4))];
        [path addLineToPoint:CGPointMake((imageViewWH / 2), 0)];
        [path addLineToPoint:CGPointMake(imageViewWH - ((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2)), (imageViewWH / 4))];
        [path addLineToPoint:CGPointMake(imageViewWH - ((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2)), (imageViewWH / 2) + (imageViewWH / 4))];
        [path addLineToPoint:CGPointMake((imageViewWH / 2), imageViewWH)];
        [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (imageViewWH / 2), (imageViewWH / 2) + (imageViewWH / 4))];
        [path closePath];
        CAShapeLayer * shapLayer = [CAShapeLayer layer];
        shapLayer.lineWidth = 2;
        shapLayer.path = path.CGPath;
        shapLayer.strokeColor = [UIColor redColor].CGColor;
        
        shapLayer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.mask = shapLayer;
    }];
}

/**
 *  平行四边形
 */
- (void)xf_setPingxing4SideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return;
        
        // 这个宽高要跟外面你要设置的 imageview 的宽高一样
        CGFloat imageViewWH = 57;
        CGFloat ww = CGRectGetWidth(self.frame);
        CGFloat hh = CGRectGetHeight(self.frame);
        CGFloat pai = M_1_PI / 180 * 60;
        UIBezierPath * path = [UIBezierPath bezierPath];
        path.lineWidth = 2;
        
        CGFloat x,y;
        x = hh/tan(M_PI / 180 * 60);
        y = 0;
        CGPoint point1 = CGPointMake(x, y);
        CGPoint point2 = CGPointMake(x+ww, y);
        CGPoint point3 = CGPointMake(ww, hh);
        CGPoint point4 = CGPointMake(0, hh);
        CGPoint point5 = point1;
        
        
        [path moveToPoint:point1];
        [path addLineToPoint:point2];
        [path addLineToPoint:point3];
        [path addLineToPoint:point4];
        //[path moveToPoint:point5];
        
        [path closePath];
        CAShapeLayer * shapLayer = [CAShapeLayer layer];
        shapLayer.lineWidth = 2;
        shapLayer.path = path.CGPath;
        shapLayer.strokeColor = [UIColor redColor].CGColor;
        
        shapLayer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.mask = shapLayer;
    }];


}

/**
 *  平行四边形
 */
- (void)xf_setPoooingxing4SideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName {
    
    CGFloat imageViewWH = 57;
    CGFloat ww = CGRectGetWidth(self.frame);
    CGFloat hh = CGRectGetHeight(self.frame);
    CGFloat pai = M_1_PI / 180 * 60;
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    UIColor* lineColor = [UIColor redColor];
    [lineColor set];
    [path stroke];
    CGFloat x,y;
    x = hh/tan(M_PI / 180 * 60);
    y = 0;
    CGPoint point1 = CGPointMake(x, y);
    CGPoint point2 = CGPointMake(x+ww/2.0f, y);
    CGPoint point3 = CGPointMake(ww/2.0f, hh);
    CGPoint point4 = CGPointMake(0, hh);
    CGPoint point5 = point1;
    
    
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path moveToPoint:point5];
    
    [path closePath];
    CAShapeLayer * shapLayer = [CAShapeLayer layer];
    shapLayer.lineWidth = 2;
    shapLayer.path = path.CGPath;
    shapLayer.strokeColor = [UIColor redColor].CGColor;
    shapLayer.fillColor = [UIColor redColor].CGColor;
    shapLayer.borderColor = [UIColor redColor].CGColor;
    shapLayer.borderWidth = 2;
    self.layer.mask = shapLayer;
}
@end

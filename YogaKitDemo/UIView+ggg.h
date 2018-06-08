//
//  UIView+ggg.h
//  YogaKitDemo
//
//  Created by biubiu on 2018/6/8.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ggg)
/**
 *  圆形
 */
- (void)xf_setCircleHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

/**
 *  方形或者圆角型
 */
- (void)xf_setRectHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

/**
 *  六边形
 */
- (void)xf_setSixSideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

- (void)xf_setPingxing4SideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;

- (void)xf_setPoooingxing4SideHeaderWithUrl:(NSString *)url placeholder:(NSString *)placeholderName;
@end

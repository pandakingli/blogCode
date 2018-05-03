//
//  UIColor+SmartHexColor.h
//  
//
//  Created by biubiublue on 2017/7/18.
//  Copyright © 2017年 biubiublue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SmartHexColor)


/**
 根据字符串获取UIColor

 @param hexString 以0X或者#开头的字符串 6位或者8位 @"#0c33b5e5"或者@"#33b5e5"
 @return UIColor
 */
+ (UIColor *)byHexString:(NSString *)hexString;


/**
 根据十六进制数字获取UIColor

 @param hexNum 十六进制数字 6位或者8位
 @return UIColor
 */
+ (UIColor *)byHexNumber:(NSUInteger)hexNum;
@end

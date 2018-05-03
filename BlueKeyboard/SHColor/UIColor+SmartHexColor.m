//
//  UIColor+SmartHexColor.m
//
//
//  Created by biubiublue on 2017/7/18.
//  Copyright © 2017年 biubiublue. All rights reserved.
//

#import "UIColor+SmartHexColor.h"

@implementation UIColor (SmartHexColor)

+ (UIColor *)byHexString:(NSString *)hexString
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return [UIColor colorWithWhite:0.2 alpha:1.0];
    
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"0x"])
        cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6 && [cString length] != 8)
        return [UIColor colorWithWhite:0.2 alpha:1.0];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString * aString = @"255";
    if ([cString length] == 8)
    {
        aString = [cString substringWithRange:range];
        range.location += 2;
    }
    
    NSString *rString = [cString substringWithRange:range];
    range.location += 2;
    
    NSString *gString = [cString substringWithRange:range];
    range.location += 2;
    
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b, a;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:((float) a / 255.0f)];
}

+ (UIColor *)byHexNumber:(NSUInteger)hexNum
{
    float r = ((hexNum>>16) & 0xFF) / 255.0f;
    float g = ((hexNum>>8) & 0xFF) / 255.0f;
    float b = (hexNum & 0xFF) / 255.0f;
    float a = ((hexNum>>24) & 0xFF) / 255.0f;
    if (a==0)
    {
        a = 1;
    }
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}
@end

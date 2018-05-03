//
//  BlueButtonModel.h
//  BlueKeyboard
//
//  Created by didi on 2018/5/3.
//  Copyright © 2018年 lining. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BlueKeyboardConst.h"

@interface BlueButtonModel : NSObject

@property(nonatomic,assign) BlueKeyButtonType btnType;
@property(nonatomic,strong) NSString *showText;
@property(nonatomic,strong) NSString *showImgUrl;
@property(nonatomic,strong) UIImage  *showImg;

@end

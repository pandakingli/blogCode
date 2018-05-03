//
//  BlueKMView.m
//  BlueKeyboard
//
//  Created by didi on 2018/5/2.
//  Copyright © 2018年 lining. All rights reserved.
//

#import "BlueKMView.h"

@interface BlueKMView()

@property(nonatomic,strong) UILabel     *showLabel;
@property(nonatomic,strong) UIImageView  *showImg;
@property(nonatomic,strong) UIControl    *clickControl;

@end

@implementation BlueKMView

-(instancetype)init
{
    self = [super init];
    if(self)
    {
         [self goInitMyself];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self goInitMyself];
    }
    
    return self;
}

-(void)goInitMyself
{
    [self setupInitialViews];
}


-(void)setupInitialViews
{
    self.showImg.frame = self.bounds;
    [self addSubview:self.showImg];
    
    self.showLabel.frame = self.bounds;
    [self addSubview:self.showLabel];
    
    self.clickControl.frame = self.bounds;
    [self addSubview:self.clickControl];
}

-(UILabel*)showLabel
{
    if (!_showLabel)
    {
        _showLabel = [[UILabel alloc]init];
    }
    
    return _showLabel;
}

-(UIImageView*)showImg
{
    if (!_showImg)
    {
        _showImg = [[UIImageView alloc]init];
    }
    
    return _showImg;
}

-(UIControl*)clickControl
{
    if (!_clickControl)
    {
        _clickControl = [[UIControl alloc]init];
    }
    
    return _clickControl;
}

-(void)setBtnModel:(BlueButtonModel *)btnModel
{
    _btnModel = btnModel;
    
    switch (_btnModel.btnType)
    {
        case BlueKeyButtonType_Normal:
            [self setupBlueKeyButtonType_Normal];
            break;
       
        case BlueKeyButtonType_Delete:
            
            break;
            
        default:
            break;
    }
    
}

-(void)setupBlueKeyButtonType_Normal
{
    self.showImg.hidden    = YES;
    self.showLabel.hidden   = NO;
    self.clickControl.hidden = NO;
    
    self.showLabel.text = self.btnModel.showText;
    
    [self.showLabel sizeToFit];
    
    CGFloat x,y,w,h;
    w = CGRectGetWidth(self.showLabel.frame);
    h = CGRectGetHeight(self.showLabel.frame);
    x = (CGRectGetWidth(self.frame)-w)/2.0f;
    y = (CGRectGetHeight(self.frame)-h)/2.0f;
    
    self.showLabel.frame = (CGRect){x,y,w,h};
    self.clickControl.frame = self.bounds;
    [self setNeedsLayout];
}
@end

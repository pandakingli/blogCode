//
//  alignCenterView.m
//  labelAndIconAlignCenter
//
//  Created by biubiu on 2018/4/25.
//  Copyright © 2018年 biubiu. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "alignCenterView.h"
#define kUserImg [UIImage imageNamed:@"emoji-28.png"]
@interface alignCenterView()

@property(nonatomic,strong) UILabel *labelTitle;

@property(nonatomic,strong) UIImageView *iconOne;
@property(nonatomic,strong) UILabel *labelOne;
@property(nonatomic,strong) UIView *containerOne;

@property(nonatomic,strong) UIImageView *iconTwo;
@property(nonatomic,strong) UILabel *labelTwo;
@property(nonatomic,strong) UIView *containerTwo;

@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;

@end

@implementation alignCenterView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupMyViews];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setupMyViews];
    }
    return self;
}

-(void)setupMyViews
{
     [self addSubview:self.labelTitle];
    
    [self addSubview:self.containerOne];
    [self.containerOne addSubview:self.iconOne];
    [self.containerOne addSubview:self.labelOne];
    
    [self addSubview:self.containerTwo];
    [self.containerTwo addSubview:self.labelTwo];
    [self.containerTwo addSubview:self.iconTwo];

    
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
  
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(200);
        make.centerX.mas_equalTo(0);
        make.leading.mas_greaterThanOrEqualTo(5);
        make.trailing.mas_lessThanOrEqualTo(-5);
        
    }];
    
    [self.containerOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.labelTitle.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
        make.leading.mas_greaterThanOrEqualTo(5);
        make.trailing.mas_lessThanOrEqualTo(-5);
        
    }];
    
    [self.iconOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self.containerOne);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(2);
        
    }];
    
    [self.labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.iconOne.mas_right).offset(5);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-2);
        
    }];
    
    
    [self.containerTwo mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(self.containerOne.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
        make.leading.mas_greaterThanOrEqualTo(5);
        make.trailing.mas_lessThanOrEqualTo(-5);
    }];
    
    [self.labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.containerTwo);
        make.left.mas_equalTo(2);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.iconTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.containerTwo);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
        make.left.equalTo(self.labelTwo.mas_right).offset(5);
        make.right.mas_equalTo(-2);
    }];
    

    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.containerTwo.mas_bottom).offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(50);
        
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.containerTwo.mas_bottom).offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(-50);
        
    }];
    
}

#pragma mark -- 懒加载

-(UILabel*)labelTitle
{
    if (!_labelTitle)
    {
        _labelTitle = [[UILabel alloc]init];
        _labelTitle.text = @"UILabel和UIIMageView长度自适应居中";
        _labelTitle.font = [UIFont systemFontOfSize:15];
        _labelTitle.backgroundColor = [UIColor orangeColor];
    }
    return _labelTitle;
}

-(UIImageView*)iconOne
{
    if (!_iconOne)
    {
        _iconOne = [[UIImageView alloc]init];
        _iconOne.backgroundColor = [UIColor redColor];
        _iconOne.image = kUserImg;
    }
    return _iconOne;
}

-(UILabel*)labelOne
{
    if (!_labelOne)
    {
        _labelOne = [[UILabel alloc]init];
        _labelOne.text = @"aaaaa";
        _labelOne.backgroundColor = [UIColor redColor];
    }
    return _labelOne;
}

-(UIView*)containerOne
{
    if (!_containerOne)
    {
        _containerOne = [[UIView alloc]init];
        _containerOne.backgroundColor = [UIColor grayColor];
    }
    return _containerOne;
}

-(UIImageView*)iconTwo
{
    if (!_iconTwo)
    {
        _iconTwo = [[UIImageView alloc]init];
        _iconTwo.backgroundColor = [UIColor redColor];
        _iconTwo.image = kUserImg;
    }
    return _iconTwo;
}

-(UILabel*)labelTwo
{
    if (!_labelTwo)
    {
        _labelTwo = [[UILabel alloc]init];
        _labelTwo.text = @"aaaaa";
        _labelTwo.backgroundColor = [UIColor redColor];
    }
    return _labelTwo;
}

-(UIView*)containerTwo
{
    if (!_containerTwo)
    {
        _containerTwo = [[UIView alloc]init];
        _containerTwo.backgroundColor = [UIColor grayColor];
    }
    return _containerTwo;
}

-(UIButton*)leftButton
{
    if (!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setBackgroundColor:[UIColor orangeColor]];
        [_leftButton setTitle:@"增加" forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

-(UIButton*)rightButton
{
    if (!_rightButton)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setBackgroundColor:[UIColor orangeColor]];
        [_rightButton setTitle:@"减少" forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(minus) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

-(void)add{
    NSString * sOne = self.labelOne.text;
    self.labelOne.text = [NSString stringWithFormat:@"%@%@",sOne,sOne];
    
    NSString * sTwo = self.labelTwo.text;
    self.labelTwo.text = [NSString stringWithFormat:@"%@%@",sTwo,sTwo];
    
}

-(void)minus{
    
    NSString * sOne = self.labelOne.text;
    if (sOne.length>2)
    {
        NSInteger num = sOne.length;
        self.labelOne.text = [sOne substringToIndex:num-2];
    }
    
    NSString * sTwo = self.labelTwo.text;
    if (sTwo.length>2)
    {
        NSInteger num = sTwo.length;
        self.labelTwo.text = [sTwo substringToIndex:num-2];
    }
}
@end

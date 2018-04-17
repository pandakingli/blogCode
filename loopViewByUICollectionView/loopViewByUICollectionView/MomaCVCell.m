//
//  MomaCVCell.m
//  loopViewByUICollectionView
//
//  Created by biubiublue on 2018/4/16.
//  Copyright © 2018年 lining. All rights reserved.
//

#import "MomaCVCell.h"

@interface MomaCVCell ()

@property(nonatomic, strong)UILabel *nameLabel;

@property(nonatomic, strong)UIImageView *myIMV;

@property(nonatomic, strong)UIView *bgView;
@end

@implementation MomaCVCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupInitialViews];
    }
    
    return self;
}

-(instancetype)init
{
    if (self = [super init])
    {
        [self setupInitialViews];
    }
    
    return self;
}

-(void)setupInitialViews
{
 
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.myIMV];
    [self doviews];
}

-(void)doviews{
    CGFloat x,y,w,h;
    x = 10;
    y = 0;
    w = CGRectGetWidth(self.bounds)-2*x;
    h = CGRectGetHeight(self.bounds);
    CGRect r_rect = (CGRect){x,y,w,h};
    self.bgView.frame = r_rect;
    
    x = CGRectGetMinX(self.bgView.frame);
    y = CGRectGetMinY(self.bgView.frame);
    w = CGRectGetWidth(self.bgView.frame);
    h = 12;
    r_rect = (CGRect){x,y,w,h};
    self.nameLabel.frame = r_rect;
    
    x = CGRectGetMinX(self.bgView.frame);
    y = CGRectGetMaxY(self.nameLabel.frame);
    w = CGRectGetWidth(self.bgView.frame);
    h = CGRectGetMaxY(self.bgView.frame)-y;
    r_rect = (CGRect){x,y,w,h};
    self.myIMV.frame = r_rect;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self doviews];
}

-(UIImageView*)myIMV
{
    if (!_myIMV)
    {
        _myIMV = [[UIImageView alloc]init];
        _myIMV.backgroundColor = [UIColor redColor];
    }
    return _myIMV;
}

-(UILabel*)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _nameLabel;
}

-(UIView*)bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor orangeColor];
    }
    return _bgView;
}

-(void)setData:(NSDictionary*)data
{
    NSString *title = [data objectForKey:@"title"];
    UIImage *img = [data objectForKey:@"img"];
    self.nameLabel.text = title;
    self.myIMV.image = img;
    
}
@end

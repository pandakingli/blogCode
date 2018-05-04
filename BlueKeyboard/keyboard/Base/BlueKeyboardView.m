//
//  BlueKeyboardView.m
//  BlueKeyboard
//
//  Created by biubiublue on 2018/4/21.
//  Copyright © 2018年biubiublue. All rights reserved.
//

#import "BlueKeyboardView.h"
#import "BlueKeyboardCell.h"
#import "BlueKeyboardManager.h"
#import "BlueKeyboardModel.h"
#import "BlueKeyboardConst.h"

@interface BlueKeyboardView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign) BlueKeyboardType keyboardType;//键盘类型
@property(nonatomic,strong) UICollectionView *kCView;//键盘按钮列表


@property(nonatomic,assign) NSInteger currentKeyboardIndex;//当前键盘
@property(nonatomic,strong) NSMutableArray<BlueKeyboardModel*> *keyboardsArray;//键盘数据数组

@property(nonatomic,strong) UIView     *kHeaderView;
@property(nonatomic,strong) UILabel    *kNameLabel;
@property(nonatomic,strong) UIButton   *kLeftBtn;//左侧切换键盘按钮
@property(nonatomic,strong) UIButton   *kRightBtn;//右侧确认按钮
@property(nonatomic,strong) UITableView *kBoardList;//键盘列表

@end

@implementation BlueKeyboardView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self goMyInit];
    }
    
    return self;
}

-(instancetype)init
{
    if (self = [super init])
    {
        [self goMyInit];
    }
    
    return self;
}

-(void)goMyInit
{
    [self setupData];//设置默认数据
    [self setupInitialViews];
    
}

-(void)setupData
{
    BlueKeyboardModel *model = [[BlueKeyboardModel alloc]init];
    model.keyView = self;
    [self.keyboardsArray addObject:model];
}

-(void)setupInitialViews
{
    
    CGFloat x,y,w,h;
    x = 0;
    y = 0;
    w = kBLUE_SCREEN_WIDTH;
    h = IS_BLUE_IPHONE_X?kValue(10+3+43+3+34):kValue(10+3+43+3);
    CGRect r_rect = (CGRect){x,y,w,h};
    self.frame = r_rect;
    self.backgroundColor = [UIColor byHexString:@"#DCDCDC"];
    [self addSubview:self.kHeaderView];
    [self addSubview:self.kCView];
    self.kNameLabel.text = [[self getCurrentKeyboard] keyboardName];
}

-(NSMutableArray<BlueKeyboardModel*>*)keyboardsArray
{
    if (!_keyboardsArray)
    {
        _keyboardsArray = [NSMutableArray arrayWithCapacity:3];
    }
    return _keyboardsArray;
}

-(UIView*)kHeaderView
{
    if (!_kHeaderView)
    {
        _kHeaderView = [[UIView alloc]init];
        CGFloat x,y,w,h;
        x = 0;
        y = 0;
        w = kBLUE_SCREEN_WIDTH;
        h = kValue(10);
        CGRect r_rect = (CGRect){x,y,w,h};
        _kHeaderView.frame = r_rect;
        _kHeaderView.backgroundColor = [UIColor grayColor];
        [_kHeaderView addSubview:self.kLeftBtn];
        [_kHeaderView addSubview:self.kNameLabel];
        [_kHeaderView addSubview:self.kRightBtn];
    }
    
    return _kHeaderView;
}

-(UIButton*)kLeftBtn
{
    if (!_kLeftBtn)
    {
        _kLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x,y,w,h;
        x = kValue(4);
        y = kValue(1);
        w = kValue(8);
        h = kValue(8);
        CGRect r_rect = (CGRect){x,y,w,h};
        _kLeftBtn.frame = r_rect;
        UIImage *img = [UIImage imageNamed:@"kBlueMore"];
        [_kLeftBtn setImage:img forState:UIControlStateNormal];
        [_kLeftBtn addTarget:self action:@selector(didClickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
       
    }
    
    
    return _kLeftBtn;
}

-(void)didClickLeftBtn
{
    NSLog(@"didClickLeftBtn");
    
}

-(UIButton*)kRightBtn
{
    if (!_kRightBtn)
    {
        _kRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x,y,w,h;
        x = kValue(88);
        y = kValue(1);
        w = kValue(8);
        h = kValue(8);
        CGRect r_rect = (CGRect){x,y,w,h};
        _kRightBtn.frame = r_rect;
        UIImage *img = [UIImage imageNamed:@"kBlueOK"];
        [_kRightBtn setImage:img forState:UIControlStateNormal];
        [_kRightBtn addTarget:self action:@selector(didClickRightBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _kRightBtn;
}

-(void)didClickRightBtn
{
    NSLog(@"didClickRightBtn");
    if (self.superview)
    {
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    }
    
}

-(UILabel*)kNameLabel
{
    if (!_kNameLabel)
    {
        _kNameLabel = [[UILabel alloc]init];
        CGFloat x,y,w,h;
        x = kValue(16);
        y = kValue(2);
        w = kValue(68);
        h = kValue(6);
        CGRect r_rect = (CGRect){x,y,w,h};
        _kNameLabel.frame = r_rect;
        _kNameLabel.backgroundColor = [UIColor whiteColor];
        _kNameLabel.text =@"键盘标题";
        _kNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _kNameLabel;
}

-(UICollectionView*)kCView
{
    if (!_kCView)
    {
        CGFloat x,y,w,h;
        x = 0;
        y = CGRectGetMaxY(self.kHeaderView.frame)+kValue(3);
        w = kBLUE_SCREEN_WIDTH;
        h = kValue(43+3);
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(kValue(7.8), kValue(7));
        
        CGRect r_rect = (CGRect){0,y,kBLUE_SCREEN_WIDTH,h};
        
        _kCView =[[UICollectionView alloc]initWithFrame:r_rect collectionViewLayout:layout];
        _kCView.dataSource = self;
        _kCView.delegate = self;
        _kCView.contentInset = UIEdgeInsetsMake(0, kValue(2), 0, kValue(2));
        [_kCView registerClass:[BlueKeyboardCell class] forCellWithReuseIdentifier:kReuseIdentifier_BlueKeyboardCell];
        _kCView.pagingEnabled = YES;
        _kCView.decelerationRate = 0;
        _kCView.showsHorizontalScrollIndicator = NO;
        _kCView.backgroundColor = [UIColor byHexString:@"#DCDCDC"];
        _kCView.delaysContentTouches = false;
        _kCView.clipsToBounds = NO;
        
    }
    
    return _kCView;
}

-(BlueKeyboardModel*)getCurrentKeyboard
{
    BlueKeyboardModel *kmodel = nil;
    NSInteger index = self.currentKeyboardIndex;
    
    if (index<self.keyboardsArray.count)
    {
        kmodel = [self.keyboardsArray objectAtIndex:index];
    }
    return kmodel;
}

#pragma mark-- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger num = 0;
    
    num = [[self getCurrentKeyboard] collectionView:collectionView numberOfItemsInSection:section];
  
    return num;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger num = 0;
    
       num =  [[self getCurrentKeyboard] numberOfSectionsInCollectionView:collectionView];
    
    return num;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BlueKeyboardCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier_BlueKeyboardCell forIndexPath:indexPath];

    [[self getCurrentKeyboard] setupWithCell:cell adnIndexPath:indexPath adnCollectionView:collectionView];
    
    return cell;
}

#pragma mark-- UICollectionViewDelegateFlowLayout
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
 
    CGFloat space = 0.0f;
    
    space = [[self getCurrentKeyboard] collectionView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section];
    
    return space;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat space = 0.0f;
    
    space = [[self getCurrentKeyboard] collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
    
    return space;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size = CGSizeZero;
    
    size = [[self getCurrentKeyboard] collectionView:collectionView layout:collectionViewLayout referenceSizeForFooterInSection:section];
            
    return  size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [[self getCurrentKeyboard] collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    return size;
}

@end

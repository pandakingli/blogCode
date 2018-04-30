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

@interface BlueKeyboardView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign) BlueKeyboardType keyboardType;

@property(nonatomic,strong) UICollectionView *keyCView;

@property(nonatomic,strong) BlueKeyboardManager *keyboardManager;

@property(nonatomic,strong) UIView *keyboardHeaderView;
@property(nonatomic,strong) UILabel *kHeadeLabel;
@property(nonatomic,strong) UIButton *kButton;


@property (nonatomic,copy)  BlueKeyboardCallBackBlcok callBackBlock;

@property(nonatomic,assign) NSInteger currentKeyboardIndex;
@property(nonatomic,strong) NSMutableArray<BlueKeyboardModel*> *keyboardsArray;
@end

@implementation BlueKeyboardView
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

-(void)setupData
{
    BlueKeyboardModel *model = [[BlueKeyboardModel alloc]init];
    [self.keyboardsArray addObject:model];
}

-(void)setupInitialViews
{
    [self setupData];
    CGFloat x,y,w,h;
    x = 0;
    y = 0;
    w = kBLUE_SCREEN_WIDTH;
    h = IS_BLUE_IPHONE_X?kValue(240+34):kValue(240);
    CGRect r_rect = (CGRect){x,y,w,h};
    self.frame = r_rect;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.keyboardHeaderView];
    [self addSubview:self.keyCView];
}

-(NSMutableArray<BlueKeyboardModel*>*)keyboardsArray
{
    if (!_keyboardsArray)
    {
        _keyboardsArray = [NSMutableArray arrayWithCapacity:3];
    }
    return _keyboardsArray;
}

-(UIView*)keyboardHeaderView
{
    if (!_keyboardHeaderView)
    {
        _keyboardHeaderView = [[UIView alloc]init];
        CGFloat x,y,w,h;
        x = 0;
        y = 0;
        w = kBLUE_SCREEN_WIDTH;
        h = kValue(52);
        CGRect r_rect = (CGRect){x,y,w,h};
        _keyboardHeaderView.frame = r_rect;
        _keyboardHeaderView.backgroundColor = [UIColor whiteColor];
        [_keyboardHeaderView addSubview:self.kButton];
        [_keyboardHeaderView addSubview:self.kHeadeLabel];
    }
    
    return _keyboardHeaderView;
}

-(UIButton*)kButton
{
    if (!_kButton)
    {
        _kButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x,y,w,h;
        x = kValue(20);
        y = kValue(14);
        w = kValue(24);
        h = kValue(24);
        CGRect r_rect = (CGRect){x,y,w,h};
        _kButton.frame = r_rect;
        //[_kButton setBackgroundImage:nil forState:UIControlStateNormal];
        [_kButton addTarget:self action:@selector(didClickXbutton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    return _kButton;
}

-(void)didClickXbutton
{
    NSLog(@"click X button");
    if (self.superview)
    {
        
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    }
    
}

-(UILabel*)kHeadeLabel
{
    if (!_kHeadeLabel)
    {
        _kHeadeLabel = [[UILabel alloc]init];
        CGFloat x,y,w,h;
        x = kValue(54);
        y = kValue(18);
        w = kValue(252);
        h = kValue(16);
        CGRect r_rect = (CGRect){x,y,w,h};
        _kHeadeLabel.frame = r_rect;
        _kHeadeLabel.text =@"请输入";
        _kHeadeLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _kHeadeLabel;
}

-(BlueKeyboardManager*)keyboardManager
{
    if (!_keyboardManager)
    {
        _keyboardManager = [[BlueKeyboardManager alloc]init];
    }
    return _keyboardManager;
}

-(UICollectionView*)keyCView
{
    if (!_keyCView)
    {
        CGFloat x,y,w,h;
        x = 0;
        y = CGRectGetMaxY(self.keyboardHeaderView.frame)+kValue(10);
        w = kBLUE_SCREEN_WIDTH;
        h = kValue(198);
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(kValue(30), kValue(38));
        
        CGRect r_rect = (CGRect){0,y,kBLUE_SCREEN_WIDTH,h};
        
        _keyCView =[[UICollectionView alloc]initWithFrame:r_rect collectionViewLayout:layout];
        _keyCView.dataSource = self;
        _keyCView.delegate = self;
        _keyCView.contentInset = UIEdgeInsetsMake(0, kValue(8), 0, kValue(7));
        [_keyCView registerClass:[BlueKeyboardCell class] forCellWithReuseIdentifier:kReuseIdentifier_BlueKeyboardCell];
        _keyCView.pagingEnabled = YES;
        _keyCView.decelerationRate = 0;
        _keyCView.showsHorizontalScrollIndicator = NO;
        _keyCView.backgroundColor = [UIColor orangeColor];
        _keyCView.delaysContentTouches = false;
        _keyCView.clipsToBounds = NO;
        
    }
    
    return _keyCView;
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

//
//  BlueKeyboardModel.m
//  BlueKeyboard
//
//  Created by biubiublue on 2018/4/29.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import "BlueKeyboardModel.h"
#import "BlueKeyboardCell.h"
#import "BlueKMView.h"
#import "BlueButtonModel.h"
#import "BlueKMView.h"


@interface BlueKeyboardModel()
@property(nonatomic,strong) NSArray *btnModelArray;
@end

@implementation BlueKeyboardModel

-(NSArray*)getDataArray
{
    //@{@"t":@"0",@"ty":@0}
    NSSelectorFromString(<#NSString * _Nonnull aSelectorName#>)
    NSArray *array2d = @[
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P"],
                         @[@">",@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L"],
                         @[@">",@"Z",@"X",@"C",@"V",@"B",@"N",@"M",@"Del"],
                         @[@">",@"Z",@"X",@"C",@"V",@"B",@"N",@"M",@"Del"],
                         ];
    
    return array2d;
    
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (void)setupWithCell:(BlueKeyboardCell*)cell adnIndexPath:(NSIndexPath *)indexPath adnCollectionView:(UICollectionView *)collectionView
{
    cell.contentView.backgroundColor = [UIColor whiteColor];
    BlueButtonModel *model = [self getButtonModelByINdexPath:indexPath];
    if (!cell.carryView)
    {
        BlueKMView* kView = [[BlueKMView alloc]initWithFrame:cell.contentView.bounds];
        [kView setBtnModel:model];
        cell.carryView = kView;
        [cell.contentView addSubview:cell.carryView];
    }
    else
    {
        if ([cell.carryView respondsToSelector:@selector(setBtnModel:)])
        {
            [cell.carryView setBtnModel:model];
        }
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kValue(7.8), kValue(7));
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kValue(2);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kValue(2-0.5f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return  CGSizeMake(kBLUE_SCREEN_WIDTH, kValue(2));
}

-(NSString*)getShowStringByIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(BlueButtonModel*)getButtonModelByINdexPath:(NSIndexPath *)indexPath
{
    BlueButtonModel* m = nil;
    if (indexPath.section<self.btnModelArray.count)
    {
        NSArray *arr = [self.btnModelArray objectAtIndex:indexPath.section];
        if (indexPath.row<arr.count)
        {
             m = [arr objectAtIndex:indexPath.row];
           
        }
    }
    return m;
}

-(NSArray*)btnModelArray
{
    if (!_btnModelArray)
    {
        _btnModelArray = [self getBtnDataArray];
    }
    
    return _btnModelArray;
}

-(NSArray*)getBtnDataArray
{
    NSMutableArray *arr =[NSMutableArray array];
    NSArray *dataArr = [self getDataArray];
    
    for (int i=0; i<dataArr.count; i++)
    {
        NSArray *rowArr = [dataArr objectAtIndex:i];
        NSMutableArray *rowBtnArr = [NSMutableArray array];
        
        for (int j=0; j<rowArr.count; j++)
        {
            BlueButtonModel *btnModel = [[BlueButtonModel alloc]init];
            btnModel.showText = [rowArr objectAtIndex:j];
            btnModel.btnType = BlueKeyButtonType_Normal;
            [rowBtnArr addObject:btnModel];
        }
        
        [arr addObject:rowBtnArr];
    }
    
    return arr.copy;
}

-(NSString*)keyboardName
{
    return @"邮箱输入键盘";
}
@end

//
//  BlueKeyboardModel.m
//  BlueKeyboard
//
//  Created by biubiublue on 2018/4/29.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import "BlueKeyboardModel.h"
#import "BlueKeyboardCell.h"

@interface BlueKeyboardModel()

@end

@implementation BlueKeyboardModel

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
    cell.contentView.backgroundColor = [UIColor redColor];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kValue(30), kValue(38));
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kValue(8);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kValue(5-0.5f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return  CGSizeMake(kBLUE_SCREEN_WIDTH, kValue(5));
}

@end

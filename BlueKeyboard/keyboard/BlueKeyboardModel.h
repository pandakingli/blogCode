//
//  BlueKeyboardModel.h
//  BlueKeyboard
//
//  Created by biubiublue on 2018/4/29.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BlueKeyboardConst.h"

@class BlueKeyboardCell;

@interface BlueKeyboardModel : NSObject

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

- (void)setupWithCell:(BlueKeyboardCell*)cell adnIndexPath:(NSIndexPath *)indexPath adnCollectionView:(UICollectionView *)collectionView;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

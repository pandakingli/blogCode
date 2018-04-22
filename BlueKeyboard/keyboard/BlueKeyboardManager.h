//
//  BlueKeyboardManager.h
//  BlueKeyboard
//
//  Created by biubiublue on 2018/4/21.
//  Copyright © 2018年biubiublue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BlueKeyboardConst.h"

@class UICollectionView;
@class BlueKeyboardCell;
@class UICollectionViewLayout;

@interface BlueKeyboardManager : NSObject

@property(nonatomic,assign) BlueKeyboardType keytype;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
-(void)setupWithCell:(BlueKeyboardCell*)cell adnIndexPath:(NSIndexPath *)indexPath adnCollectionView:(UICollectionView *)collectionView;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

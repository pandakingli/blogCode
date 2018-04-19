//
//  ViewController.m
//  loopViewByUICollectionView
//
//  Created by biubiublue on 2018/4/16.
//  Copyright © 2018年 lining. All rights reserved.
//

#import "ViewController.h"
#import "MomaCVCell.h"

#define kMYSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

#define kReuseIdentifier_MomaCVCell @"MomaCVCell"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *collectionview;
@property(nonatomic, strong)UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionview];
    [self.view addSubview:self.pageControl];
    
}

-(UIPageControl*)pageControl
{
    if (!_pageControl)
    {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = 10;
        CGFloat x,y,w,h,left,top;
        top = 10;
        left = 10;
        x = left;
        y = CGRectGetMaxY(self.collectionview.frame)-20;
        w = CGRectGetWidth(self.collectionview.frame)-2*left;
        h = 10;
        CGRect r_rect = (CGRect){x,y,w,h};
        
        _pageControl.frame = r_rect;
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.userInteractionEnabled = YES;
        [_pageControl addTarget:self action:@selector(clickPageController:event:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pageControl;
}

- (void)clickPageController:(UIPageControl *)pageController event:(UIEvent *)touchs
{
    UITouch *touch = [[touchs allTouches] anyObject];
    CGPoint p = [touch locationInView:_pageControl];
    CGFloat centerX = pageController.center.x;
    CGFloat left = centerX-15.0*10/2;
    [_pageControl setCurrentPage:(int ) (p.x-left)/15];
    
    [_collectionview setContentOffset:CGPointMake(_pageControl.currentPage*kMYSCREEN_WIDTH, 0) animated:YES];
    NSLog(@"%f",(p.x-left)/15);
}


-(UICollectionView*)collectionview
{
    if (!_collectionview)
    {
    
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        layout.itemSize = CGSizeMake(kMYSCREEN_WIDTH, 100);
        CGRect r_rect = (CGRect){0,100,kMYSCREEN_WIDTH,100};
        _collectionview =[[UICollectionView alloc]initWithFrame:r_rect collectionViewLayout:layout];
        _collectionview.dataSource = self;
        _collectionview.delegate = self;
        _collectionview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionview registerClass:[MomaCVCell class] forCellWithReuseIdentifier:kReuseIdentifier_MomaCVCell];
        _collectionview.pagingEnabled = YES;
        _collectionview.decelerationRate = 0;
        _collectionview.showsHorizontalScrollIndicator = NO;
        _collectionview.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _collectionview;
}

#pragma mark-- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MomaCVCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier_MomaCVCell forIndexPath:indexPath];
    NSString *ss = [NSString stringWithFormat:@"标题-%ld",(long)indexPath.row];
    [cell setData:@{@"title":ss}];
    return cell;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%10;
    self.pageControl.currentPage = page;
}

@end

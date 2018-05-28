//
//  ViewController.m
//  labelAndIconAlignCenter
//
//  Created by biubiublue on 2018/4/25.
//  Copyright © 2018年 biubiublue. All rights reserved.
//

#import "ViewController.h"
#import "alignCenterView.h"

@interface ViewController ()
@property(nonatomic,strong) alignCenterView *acView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.acView = [[alignCenterView alloc]init];
    self.acView.frame = self.view.bounds;
    [self.view addSubview:self.acView];
}


@end

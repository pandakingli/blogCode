//
//  BlueKMView.m
//  BlueKeyboard
//
//  Created by didi on 2018/5/2.
//  Copyright © 2018年 lining. All rights reserved.
//

#import "BlueKMView.h"

@interface BlueKMView()

@end

@implementation BlueKMView

-(instancetype)init
{
    self = [super init];
    if(self)
    {
         [self goInitMyself];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self goInitMyself];
    }
    
    return self;
}

-(void)goInitMyself
{
    
}
@end

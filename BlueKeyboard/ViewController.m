//
//  ViewController.m
//  BlueKeyboard
//
//  Created by biubiublue on 2018/4/21.
//  Copyright © 2018年biubiublue. All rights reserved.
//

#import "ViewController.h"
#import "BlueKeyboardView.h"

@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat x,y,w,h;
    
    x = 10;
    y = 100;
    w = 150;
    h = 20;
    CGRect r_rect = (CGRect){x,y,w,h};
    self.textField.frame = r_rect;
    [self.view addSubview:self.textField];
    BlueKeyboardView *blueView = [[BlueKeyboardView alloc]init];
    self.textField.inputView = blueView;
}

-(UITextField*)textField
{
    if (!_textField)
    {
        _textField = [[UITextField alloc]init];
        _textField.placeholder = @"请输入文字";
        _textField.delegate = self;
    }
    return _textField;
}


@end

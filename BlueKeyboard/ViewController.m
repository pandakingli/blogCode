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
    
    [blueView setCallBackBlock:^(NSString *text, BlueKeyButtonType btnType) {
        
        if (btnType == BlueKeyButtonType_Delete)
        {
            if (self.textField.text.length > 0)
            {
                self.textField.text = [self.textField.text substringToIndex: self.textField.text.length - 1];
            }
            
        }
        
        if (btnType == BlueKeyButtonType_Normal)
        {
            NSString *result = [NSString stringWithFormat: @"%@%@",self.textField.text, text];
            self.textField.text = result;
        }
        
    }];
    
    
    
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

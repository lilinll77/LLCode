//
//  ViewController.m
//  LLOpVSCGD
//
//  Created by lilinli on 2017/11/15.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UISwitch *switchButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.switchButton];
}

#pragma mark - response

- (void)onStartClick:(UIControl *)sender
{
    if (self.switchButton.on)
    {
        
    }
    else
    {
        
    }
}

#pragma mark - Property

- (UIButton *)startButton
{
    if (!_startButton)
    {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startButton setTitle:@"启动" forState:UIControlStateNormal];
        CGFloat right = [UIScreen mainScreen].bounds.size.width - 50;
        _startButton.frame = CGRectMake(right - 70, 100, 70, 50);
        
        _startButton.backgroundColor = [UIColor grayColor];
        
        [_startButton addTarget:self action:@selector(onStartClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _startButton;
}

- (UISwitch *)switchButton
{
    if (!_switchButton)
    {
        _switchButton = [[UISwitch alloc] init];
        CGFloat right = [UIScreen mainScreen].bounds.size.width - 50 - self.startButton.frame.size.width;
        _switchButton.frame = CGRectMake(right - 70, 100, 70, 50);
    }
    
    return _switchButton;
}

+ (Task)getATask
{
    Task oneTask = ^{
        NSLog(@"execute");
    };
    
    return oneTask;
}

@end

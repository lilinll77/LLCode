//
//  ViewController.m
//  LLInstrumentDemo
//
//  Created by lilinli on 2017/9/11.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];

//    btn.frame= CGRectMake(0, 0, 40, 44);
    btn.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 150;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right,nil];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.view addSubview:self.pushButton];
}

- (void)onPush:(id)sender
{
    ViewController *pushedVC = [ViewController new];
                     
    [self.navigationController pushViewController:pushedVC animated:YES];
}

- (UIButton *)pushButton
{
    if (_pushButton == nil) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushButton addTarget:self action:@selector(onPush:) forControlEvents:UIControlEventTouchUpInside];
        
        _pushButton.frame = CGRectMake(200, 100, 70, 50);
        [_pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _pushButton.font = [UIFont systemFontOfSize:16];
        [_pushButton setTitle:@"push" forState:UIControlStateNormal];
    }
    
    return _pushButton;
}

@end

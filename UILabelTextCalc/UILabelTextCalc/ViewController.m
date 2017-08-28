//
//  ViewController.m
//  UILabelTextCalc
//
//  Created by lilinli on 2017/8/28.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "ViewController.h"
#import "LLResultTableViewCell.h"
#import "LLTextRectCalcHelper.h"

@interface ViewController ()

@property (nonatomic, strong) UITextView *inputView;
@property (nonatomic, strong) UITableView *compareView;
@property (nonatomic, strong) UIButton *confirmView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataSource = [NSMutableArray arrayWithCapacity:1];
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.compareView];
    [self.view addSubview:self.confirmView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - response deleage

- (void)onCombare:(id)sender
{
    [self reloadData];
}

#pragma makr - 实现委托  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify;
    if (!identify) {
        identify = NSStringFromClass([LLResultTableViewCell class]);
    }
    
    LLResultTableViewCell *cell = [self.compareView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[LLResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark - Property

- (UITextView *)inputView
{
    if (!_inputView)
    {
        CGRect frame = CGRectMake(5, 44, 100, 50);
        _inputView = [[UITextView alloc] initWithFrame:frame];
        _inputView.backgroundColor = [UIColor yellowColor];
        _inputView.editable = YES;
    }
    
    return _inputView;
}

- (UITableView *)compareView
{
    if (!_compareView)
    {
        CGRect frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 145);
        _compareView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _compareView.delegate = self;
        _compareView.dataSource = self;
        _compareView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    return _compareView;
}

- (UIButton *)confirmView
{
    if (!_confirmView)
    {
        CGRect frame = CGRectMake(106, 44, 50, 50);
        _confirmView = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmView.frame = frame;
        [_confirmView setTitle:@"比较" forState:UIControlStateNormal];
        [_confirmView setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_confirmView addTarget:self action:@selector(onCombare:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _confirmView;
}

#pragma mark - Private

- (void)reloadData
{
    NSString *calcStr = self.inputView.text;
    if (!calcStr)
    {
        calcStr = [self defaultStr];
    }
    
    [_dataSource removeAllObjects];
    
    NSMutableArray *calcFunctions;
    CGRect(^calcFunction)(CGSize);
    
    for (NSInteger i = 0; i < calcFunctions.count; ++i)
    {
        NSTimeInterval beginTime = [[NSDate date] timeIntervalSinceReferenceDate];
        
        
        NSTimeInterval endTime = [[NSDate date] timeIntervalSinceReferenceDate];
        NSTimeInterval cost = endTime - beginTime;
        NSMutableDictionary *calcUseStirngFunction = [NSMutableDictionary dictionaryWithCapacity:2];
        [calcUseStirngFunction setObject:@(cost) forKey:@"kCost"];
        [calcUseStirngFunction setObject:@"使用NSString " forKey:@"kCalcType"];
        [_dataSource addObject:calcUseStirngFunction];
    }
    [self.compareView reloadData];
}

- (NSString *)defaultStr
{
    return @"";
}

@end

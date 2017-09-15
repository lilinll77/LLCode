//
//  ViewController.m
//  LLInstrumentDemo
//
//  Created by lilinli on 2017/9/11.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "ViewController.h"
#import "LLResultTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *compareView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

#pragma mark - 生命周期

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    [self.view addSubview:self.compareView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initData];
}

#pragma mark - 数据

- (void)initData
{
    _dataSource = [NSMutableArray array];
    
    NSInteger row = 1000;
    NSInteger col = Colume;
    
    for (NSInteger i = 0; i < row; ++i)
    {
        NSMutableArray *column = [NSMutableArray array];
        for (NSInteger j = 0; j < col; ++j)
        {
            NSInteger randIndex = rand() % 30;
            [column addObject:[NSString stringWithFormat:@"res_%ld.png", randIndex]];
        }
        
        [_dataSource addObject:column];
    }
}

#pragma mark - 实现委托  UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
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
    
    NSArray *imageArray = [_dataSource objectAtIndex:indexPath.row];
    [cell setData:imageArray];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RowHight;
}

#pragma mark - Property

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

@end

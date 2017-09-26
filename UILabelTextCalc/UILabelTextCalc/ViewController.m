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
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,LLCalcType)
{
    LLCalcType_NSString = 1,
    LLCalcType_NSAttributeString,
    LLCalcType_CoreText,
    LLCalcType_UILabel,
    LLCalcType_Max,
};

@interface ViewController ()

@property (nonatomic, strong) UITextView *inputView;
@property (nonatomic, strong) UITableView *compareView;
@property (nonatomic, strong) UIButton *confirmView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UILabel *lengthView;
@property (nonatomic, assign) CGSize curSize;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataSource = [NSMutableArray arrayWithCapacity:1];
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.compareView];
    [self.view addSubview:self.confirmView];
    [self.view addSubview:self.lengthView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - response deleage

// 遍历所有英文
//- (void)onCombare:(id)sender
//{
//    char a = 'a';
//    for (NSInteger i=0; i<26; ++i)
//    {
//        char tempChar = a + i;
//        _curSize = CGSizeZero;
//        CGSize orgSize = _curSize;
//        NSString *str = [NSString stringWithUTF8String:&tempChar];
//        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        
//        _inputView.text = nil;
//        
//        while (orgSize.height == _curSize.height)
//        {
//            self.inputView.text = [NSString stringWithFormat:@"%@%@",self.inputView.text,str];
//            [self reloadData];
//            
//            if (orgSize.width == 0) {
//                orgSize = _curSize;
//            }
//        }
//        
//        NSLog(@"%c %ld个字符",[_inputView.text characterAtIndex:0],  _inputView.text.length/str.length);
//    }
//}

// 遍历所有中文
- (void)onCombare:(id)sender
{
    unichar a = 0x4e00;
//    0x4e00 && a < 0x9fff
    
    for (NSInteger i=0; i<(0x9fff - 0x4e00); ++i)
//    for (NSInteger i=0; i<20; ++i)
    {
        unichar tempChar = a + i;
        _curSize = CGSizeZero;
        CGSize orgSize = _curSize;
        NSString *str = [NSString stringWithCharacters:&tempChar length:1];
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        _inputView.text = nil;

        while (orgSize.height == _curSize.height)
        {
            self.inputView.text = [NSString stringWithFormat:@"%@%@",self.inputView.text,str];
            [self reloadData];

            if (orgSize.width == 0) {
                orgSize = _curSize;
            }
        }
        
        if (_inputView.text.length != 22)
        {
            NSLog(@"----------奇怪的字符出现了-------- %@ %ld个字符",_inputView.text,  _inputView.text.length/str.length);
//            break;
        }

        NSLog(@"%@ %ld个字符",_inputView.text,  _inputView.text.length/str.length);
    }
}

//- (void)onCombare:(id)sender
//{
//    for (NSInteger i=0; i<10; ++i)
//    {
//        _curSize = CGSizeZero;
//        CGSize orgSize = _curSize;
//        NSString *str = [NSString stringWithFormat:@"%ld",i];
//        _inputView.text = nil;
//        
//        while (orgSize.height == _curSize.height)
//        {
//            self.inputView.text = [NSString stringWithFormat:@"%@%@",self.inputView.text,str];
//            [self reloadData];
//            
//            if (orgSize.width == 0) {
//                orgSize = _curSize;
//            }
//        }
//        
//        NSLog(@"%c %ld个字符",[_inputView.text characterAtIndex:0], _inputView.text.length);
//    }
//}

//- (void)onCombare:(id)sender
//{
//    [self reloadData];
//}

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
    
    NSDictionary *dataDict = [_dataSource objectAtIndex:indexPath.row];
    
    cell.calcType = dataDict[@"kCalcTypeString"];
    cell.cost = [dataDict[@"kCost"] floatValue];
    cell.rect = dataDict[@"kCalcResultRect"];
    
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

- (UILabel *)lengthView
{
    if (!_lengthView)
    {
        CGRect frame = CGRectMake(160, 44, 100, 50);
        _lengthView = [UILabel new];
        _lengthView.frame = frame;
        _lengthView.backgroundColor = [UIColor yellowColor];
    }
    
    return _lengthView;
}

#pragma mark - Private

- (void)reloadData
{
    NSString *calcStr = self.inputView.text;
    if (!calcStr)
    {
        calcStr = [self defaultStr];
    }
    _lengthView.text = [NSString stringWithFormat:@"%lu个字符",(unsigned long)calcStr.length];
    
    [_dataSource removeAllObjects];
    
    for (NSInteger i = LLCalcType_NSString; i < LLCalcType_Max; ++i)
    {
        NSTimeInterval beginTime = [[NSDate date] timeIntervalSinceReferenceDate];
        
        NSDictionary *calResult = [self calcByType:i calcedString:calcStr size:CGSizeMake(300, MAXFLOAT)];
        
        NSMutableDictionary *mutabelDict = [NSMutableDictionary dictionaryWithDictionary:calResult];
        
        NSTimeInterval endTime = [[NSDate date] timeIntervalSinceReferenceDate];
        NSTimeInterval cost = endTime - beginTime;
        
        [mutabelDict setObject:@(cost) forKey:@"kCost"];
        [mutabelDict setObject:@(i) forKey:@"kCalcType"];

        [_dataSource addObject:mutabelDict];
    }
    [self.compareView reloadData];
}

- (NSDictionary *)calcByType:(NSInteger)type calcedString:(NSString *)str size:(CGSize)limitSize
{
    NSMutableDictionary *retDict = [NSMutableDictionary dictionaryWithCapacity:1];
    
    switch (type) {
        case LLCalcType_NSString:
        {
            _curSize = [LLTextRectCalcHelper calcByNSStringFunction:str withSize:limitSize];
            [retDict setObject:@"使用NSString方法计算Rect" forKey:@"kCalcTypeString"];
            [retDict setObject:[NSString stringWithFormat:@"{%.3f,%.3f}",_curSize.width, _curSize.height] forKey:@"kCalcResultRect"];
        }
            break;
            
        case LLCalcType_NSAttributeString:
        {
            _curSize = [LLTextRectCalcHelper calcByNSAttributeStringFunction:str withSize:limitSize];
            [retDict setObject:@"使用NSAttributeString方法计算Rect" forKey:@"kCalcTypeString"];
            [retDict setObject:[NSString stringWithFormat:@"{%.3f,%.3f}",_curSize.width, _curSize.height] forKey:@"kCalcResultRect"];
        }
            break;
            
        case LLCalcType_CoreText:
        {
            _curSize = [LLTextRectCalcHelper calcByCoreTextFunction:str withSize:limitSize];
            [retDict setObject:@"使用CoreText方法计算Rect" forKey:@"kCalcTypeString"];
            [retDict setObject:[NSString stringWithFormat:@"{%.3f,%.3f}",_curSize.width, _curSize.height] forKey:@"kCalcResultRect"];
        }
            break;
            
        case LLCalcType_UILabel:
        {
            _curSize = [LLTextRectCalcHelper calcByUILabelFunction:str withSize:limitSize];
            [retDict setObject:@"使用UILabel方法计算Rect" forKey:@"kCalcTypeString"];
            [retDict setObject:[NSString stringWithFormat:@"{%.3f,%.3f}",_curSize.width, _curSize.height] forKey:@"kCalcResultRect"];
        }
            break;
            
        default:
            break;
    }
    
    return retDict;
}

- (NSString *)defaultStr
{
    return @"";
}

@end

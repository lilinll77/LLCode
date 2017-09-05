//
//  LLResultTableViewCell.m
//  UILabelTextCalc
//
//  Created by lilinli on 2017/8/28.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "LLResultTableViewCell.h"

@interface LLResultTableViewCell ()

@property (nonatomic, strong) UILabel *costView;
@property (nonatomic, strong) UILabel *calctypeDesptionView;
@property (nonatomic, strong) UILabel *rectTextView;

@end

@implementation LLResultTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self addSubview:self.costView];
    [self addSubview:self.calctypeDesptionView];
    [self addSubview:self.rectTextView];
}


#pragma mark - Property

- (UILabel *)calctypeDesptionView
{
    if (!_calctypeDesptionView) {
        _calctypeDesptionView = [UILabel new];
        _calctypeDesptionView.frame = CGRectMake(0, 0, 100, 70);
        _calctypeDesptionView.numberOfLines = 0;
    }
    
    return _calctypeDesptionView;
}


- (UILabel *)costView
{
    if (!_costView) {
        _costView = [UILabel new];
        _costView.frame = CGRectMake(105, 0, 100, 70);
    }
    
    return _costView;
}

- (UILabel *)rectTextView
{
    if (!_rectTextView) {
        _rectTextView = [UILabel new];
        _rectTextView.frame = CGRectMake(205, 0, 150, 70);
    }
    
    return _rectTextView;
}

- (void)setCost:(NSTimeInterval)cost
{
    NSString *showString = [NSString stringWithFormat:@"%f", cost];
    self.costView.text = showString;
}

- (void)setCalcType:(NSString *)calcType
{
    self.calctypeDesptionView.text = calcType;
}

- (void)setRect:(NSString *)rect
{
    self.rectTextView.text = rect;
}

@end

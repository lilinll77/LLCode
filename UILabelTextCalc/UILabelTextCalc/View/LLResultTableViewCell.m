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

@end

@implementation LLResultTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self addSubview:self.costView];
    [self addSubview:self.calctypeDesptionView];
}


#pragma mark - Property

- (UILabel *)calctypeDesptionView
{
    if (!_calctypeDesptionView) {
        _calctypeDesptionView = [UILabel new];
        _calctypeDesptionView.frame = CGRectMake(0, 0, 200, 70);
        _calctypeDesptionView.numberOfLines = 0;
    }
    
    return _calctypeDesptionView;
}


- (UILabel *)costView
{
    if (!_costView) {
        _costView = [UILabel new];
        _costView.frame = CGRectMake(205, 0, 100, 70);
    }
    
    return _costView;
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

@end

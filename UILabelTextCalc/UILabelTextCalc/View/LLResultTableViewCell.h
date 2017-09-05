//
//  LLResultTableViewCell.h
//  UILabelTextCalc
//
//  Created by lilinli on 2017/8/28.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLResultTableViewCell : UITableViewCell

@property (nonatomic, assign) NSTimeInterval cost;
@property (nonatomic, strong) NSString *calcType;
@property (nonatomic, strong) NSString *rect;

@end

//
//  HoriCell.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "HoriCell.h"
#import "Viewfactory.h"


@interface HoriCell ()

@property (nonatomic) UILabel *title;
@property (nonatomic) UILabel *subTitle;
@property (nonatomic) UIImageView *icon;

@end

@implementation HoriCell

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    
    return self;
}

- (void)setViewModel:(EntryViewModel *)viewModel {
    self.title.text = viewModel.model.htmlTitle;
    [self.title sizeToFit];
    
    self.subTitle.text = viewModel.model.htmlTitle;
    [self.subTitle sizeToFit];
}

- (void)setUpView {
    [self addSubview:self.title];
    [self addSubview:self.subTitle];
    [self addSubview:self.icon];
}

#pragma mark - == Getter ==

- (UILabel *)title {
    if(!_title) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(40.0f, 5, 30.f, 20.f);
    }
    
    return _title;
}

- (UILabel *)subTitle {
    if(!_subTitle) {
        _subTitle = [[UILabel alloc] init];
        _subTitle.frame = CGRectMake(40.0f, 25, 30.f, 20.f);
    }
    
    return _subTitle;
}

- (UIImageView *)icon {
    if(!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(5.0f, 10, 30.f, 30.f);
        _icon.backgroundColor = [UIColor yellowColor];
    }
    
    return _icon;
}


@end

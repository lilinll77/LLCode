//
//  GridCellCollectionViewCell.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "GridCell.h"
#import "Viewfactory.h"

@interface GridCell ()

@property (nonatomic) UILabel *title;
@property (nonatomic) UIImageView *icon;

@end

@implementation GridCell

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    
    return self;
}

- (void)setViewModel:(EntryViewModel *)viewModel {
    self.title.text = viewModel.model.htmlTitle;
    [self.title sizeToFit];
}

- (void)setUpView {
    [self addSubview:self.title];
    [self addSubview:self.icon];
}

#pragma mark - == Getter ==

- (UILabel *)title {
    if(!_title) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(5.0f, 35, 30.f, 20.f);
    }
    
    return _title;
}

- (UIImageView *)icon {
    if(!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.frame = CGRectMake(5.0f, 0, 30.f, 30.f);
        _icon.backgroundColor = [UIColor orangeColor];
    }
    
    return _icon;
}


@end

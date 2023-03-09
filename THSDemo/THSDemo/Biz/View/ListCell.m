//
//  ListCell.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "ListCell.h"
#import "Viewfactory.h"

@interface ListCell ()

@property (nonatomic) UILabel *title;
@property (nonatomic) UIImageView *icon;

@end

@implementation ListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpView];
    }
    
    return self;
}

- (void)setUpView {
    [self addSubview:self.title];
    [self addSubview:self.icon];
}

- (void)setViewModel:(EntryViewModel *)viewModel {
    
    // 网络图片控件，这里不写了，一般用sdwebimage
//    self.imageView = viewModel.model.iconUrl;
    
    // 理论上要用富文本控件，不过UI稿上不会出现这种情况
    self.title.text = viewModel.model.htmlTitle;
    [self.title sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - == Getter ==

- (UILabel *)title {
    if(!_title) {
        _title = [[UILabel alloc] init];
        _title.frame = CGRectMake(50.0f, 5, 30.f, 30.f);
    }
    
    return _title;
}

- (UIImageView *)icon {
    if(!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor orangeColor];
        _icon.frame = CGRectMake(5.0f, 5.0, 30.f, 20.f);
    }
    
    return _icon;
}

@end

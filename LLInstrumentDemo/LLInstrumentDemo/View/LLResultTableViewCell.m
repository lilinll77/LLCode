//
//  LLResultTableViewCell.m
//  UILabelTextCalc
//
//  Created by lilinli on 2017/8/28.
//  Copyright © 2017年 lilinli. All rights reserved.
//

#import "LLResultTableViewCell.h"

@interface LLResultTableViewCell ()

@property (nonatomic, strong) NSMutableArray<UIImageView *> *images;

@end

@implementation LLResultTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        for (UIImageView *imageView in self.images)
        {
            [self.contentView addSubview:imageView];
        }
    }
    
    return self;
}

#pragma mark - Property

- (void)setData:(NSArray *)imageArray
{
    for (NSInteger i = 0; i < imageArray.count; ++i)
    {
        NSString *resPath = imageArray[i];
        UIImage *pngImage = [UIImage imageNamed:resPath];
        self.images[i].image = pngImage;
    }
}

- (NSMutableArray<UIImageView *> *)images
{
    if (!_images)
    {
        _images = [NSMutableArray array];
        
        CGFloat offset = 5;
        for (NSInteger i = 0; i < Colume; ++i)
        {
            CGFloat xPixel = i * offset + i * RowHight;
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.layer.cornerRadius = 40;
            imageView.layer.masksToBounds = YES;
            imageView.clipsToBounds = YES;
            imageView.backgroundColor = [UIColor blackColor];
            imageView.layer.opaque = YES;
            imageView.frame = CGRectMake(xPixel, 0, RowHight, RowHight);
            
            [_images addObject:imageView];
        }
    }
    
    return _images;
}

@end

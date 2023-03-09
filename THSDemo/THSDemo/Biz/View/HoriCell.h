//
//  HoriCell.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EntryViewModel;

@interface HoriCell : UICollectionViewCell

- (void)setViewModel:(EntryViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END

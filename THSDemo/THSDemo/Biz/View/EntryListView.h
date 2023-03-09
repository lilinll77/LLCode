//
//  EntryListView.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EntryViewModel;

@interface EntryListView : UIView

+ (CGFloat)totalHeight:(NSArray<EntryViewModel *> *)entrys;

- (instancetype)initWithModel:(NSArray<EntryViewModel *> *)entrys;

@end

NS_ASSUME_NONNULL_END

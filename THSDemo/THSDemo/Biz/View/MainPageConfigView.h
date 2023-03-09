//
//  MainPageConfigView.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MainPageModel;

@interface MainPageConfigView : UIView

- (instancetype)initWithConfig:(MainPageModel *)config;

- (void)reload;

@end

NS_ASSUME_NONNULL_END

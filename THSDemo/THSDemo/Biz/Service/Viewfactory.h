//
//  Viewfactory.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContainerConfigModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryViewModel : NSObject

@property (nonatomic) EntryModel *model;

- (void)router;

@end


@interface ContainerViewModel : NSObject

@property (nonatomic) ContainerConfigModel *model;

- (CGFloat)height;

- (UIView *)getContainer;

@end

typedef NS_ENUM(NSInteger, ContainerType) {
    ContainerTypeGrid = 1,
    ContainerTypeList = 2,
    ContainerTypeHori = 3,
};

@protocol IViewfactory <NSObject>

- (ContainerViewModel *)createContainerViewModel:(ContainerConfigModel *)config;

@end

@interface Viewfactory : NSObject <IViewfactory>

@end

NS_ASSUME_NONNULL_END

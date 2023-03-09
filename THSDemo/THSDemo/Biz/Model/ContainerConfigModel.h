//
//  ContainerConfigModel.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EntryModel : NSObject

@property (nonatomic) NSString *iconUrl;
@property (nonatomic) NSString *htmlTitle;
@property (nonatomic) NSString *htmlSubTitle;
@property (nonatomic) NSString *router;

- (instancetype)initWithPb:(id)pbData;

@end

@interface ContainerConfigModel : NSObject

@property (assign) int type;
@property (nonatomic) NSArray<EntryModel *> *entrys;

- (instancetype)initWithPb:(id)pbData;

@end

@interface MainPageModel : NSObject

@property (nonatomic) NSArray<ContainerConfigModel *> *configs;

@end

NS_ASSUME_NONNULL_END

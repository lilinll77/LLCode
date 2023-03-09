//
//  RouterService.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IRouterService <NSObject>

- (void)routerPage:(NSString *)routerUrl;

@end

@interface RouterService : NSObject <IRouterService>

@end

NS_ASSUME_NONNULL_END

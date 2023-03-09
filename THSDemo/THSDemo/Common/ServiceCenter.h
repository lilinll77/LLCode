//
//  ServiceCenter.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - == 中介器 ==

@interface ServiceCenter : NSObject

+ (ServiceCenter *)sharedInstance;

- (void)registerService:(NSString *)protocol impl:(id)iSrv;
- (void)unRegisterService:(NSString *)protocol;
- (id)getSrv:(NSString *)protocol;

@end

NS_ASSUME_NONNULL_END

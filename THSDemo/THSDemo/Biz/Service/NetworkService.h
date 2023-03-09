//
//  NetworkService.h
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SUCCEED)(id response);
typedef void(^FAILED)(int errCode, NSString *errMsg);


@protocol INetworkService <NSObject>

- (void)sendRequest:(id)pbReq succedd:(SUCCEED)sucBlock fail:(FAILED)failBlock;

@end

@interface NetworkService : NSObject <INetworkService>

@end

NS_ASSUME_NONNULL_END

//
//  RouterService.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "RouterService.h"
#import "ServiceCenter.h"

@implementation RouterService

+ (void)load {
    
    NSString *key = NSStringFromProtocol(@protocol(IRouterService));
    [[ServiceCenter sharedInstance] registerService:key impl:[[RouterService alloc] init]];
}

- (void)routerPage:(NSString *)routerUrl {
    
    // 发起跳转，一般使用页面路由组件
    NSLog(@"router url = %@", routerUrl);
}


@end

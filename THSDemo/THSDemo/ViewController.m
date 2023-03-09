//
//  ViewController.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "ViewController.h"
#import "ServiceCenter.h"
#import "NetworkService.h"
#import "ContainerConfigModel.h"
#import "MainPageConfigView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showLoading];
    
    // 基于用户体验，这里应该先取缓存展示页面，再发起请求，刷新页面
    
    id<INetworkService> network = [[ServiceCenter sharedInstance] getSrv:NSStringFromProtocol(@protocol(INetworkService))];
    [network sendRequest:nil succedd:^(id  _Nonnull response) {
        
        if([response isKindOfClass:[MainPageModel class]]) {
            [self setUpView:response];
            
            // todo 写缓存
        }
        
    } fail:^(int errCode, NSString * _Nonnull errMsg) {
        
    }];
}

- (void)showLoading {
}

- (void)hideLoading {
}

- (void)setUpView:(MainPageModel *)config {
    
    MainPageConfigView *mainView = [[MainPageConfigView alloc] initWithConfig:config];
    mainView.frame = self.view.bounds;
    [self.view addSubview:mainView];
    
    [self hideLoading];
}


@end

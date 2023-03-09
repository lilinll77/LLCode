//
//  NetworkService.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "NetworkService.h"
#import "ContainerConfigModel.h"
#import "ServiceCenter.h"

@implementation NetworkService

+ (void)load {
    
    NSString *key = NSStringFromProtocol(@protocol(INetworkService));
    [[ServiceCenter sharedInstance] registerService:key impl:[[NetworkService alloc] init]];
}

- (void)sendRequest:(id)pbReq succedd:(SUCCEED)sucBlock fail:(FAILED)failBlock {
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 异步数据处理
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 主线程回调
            NSMutableArray *configs = [NSMutableArray array];
            
            {
                ContainerConfigModel *dummy = [[ContainerConfigModel alloc] init];
                dummy.type = 1;
                
                NSMutableArray *entrys = [NSMutableArray array];
                for (int i = 0; i < 9; ++i) {
                    EntryModel *entry = [[EntryModel alloc] init];
                    entry.htmlTitle = [NSString stringWithFormat:@"title%d", i];
                    [entrys addObject:entry];
                }
                
                dummy.entrys = entrys;
                [configs addObject:dummy];
            }
            
            {
                ContainerConfigModel *dummy = [[ContainerConfigModel alloc] init];
                dummy.type = 3;
                NSMutableArray *entrys = [NSMutableArray array];
                for (int i = 0; i < 3; ++i) {
                    EntryModel *entry = [[EntryModel alloc] init];
                    entry.htmlTitle = [NSString stringWithFormat:@"title%d", i];
                    entry.htmlSubTitle = [NSString stringWithFormat:@"title%d", i + 100];
                    [entrys addObject:entry];
                }
                
                dummy.entrys = entrys;
                [configs addObject:dummy];
                
            }
            
            {
                ContainerConfigModel *dummy = [[ContainerConfigModel alloc] init];
                dummy.type = 2;
                NSMutableArray *entrys = [NSMutableArray array];
                for (int i = 0; i < 7; ++i) {
                    EntryModel *entry = [[EntryModel alloc] init];
                    entry.htmlTitle = [NSString stringWithFormat:@"title%d", i];
                    [entrys addObject:entry];
                }
                
                dummy.entrys = entrys;
                [configs addObject:dummy];
            }
            
            MainPageModel *dymmyMainPage = [[MainPageModel alloc] init];
            dymmyMainPage.configs = configs;
            
            if(sucBlock) {
                sucBlock(dymmyMainPage);
            }
            
        });
    });
}

@end

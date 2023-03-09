//
//  Viewfactory.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "Viewfactory.h"
#import "ServiceCenter.h"
#import "EntryListView.h"
#import "EntryGridView.h"

@implementation Viewfactory

+ (void)load {
    NSString *key = NSStringFromProtocol(@protocol(IViewfactory));
    [[ServiceCenter sharedInstance] registerService:key impl:[[Viewfactory alloc] init]];
}

- (ContainerViewModel *)createContainerViewModel:(ContainerConfigModel *)config; {
    
    // 通用控件在这里处理，需要拓展的话可以继承这个类然后注册到service center中
    ContainerViewModel *ret = [[ContainerViewModel alloc] init];
    ret.model = config;
       
    return ret;
}

@end


@implementation EntryViewModel

- (void)router {
    NSString *router = self.model.router;
    NSLog(@"jump to another pagd %@", router);
}

@end


@interface ContainerViewModel ()

@property (assign) CGFloat height;
@property (nonatomic) UIView *container;

@end

@implementation ContainerViewModel

- (CGFloat)height {
    if(_height == 0.f) {
        switch(self.model.type) {
            case ContainerTypeGrid:{
                _height = [EntryGridView totalHeight:self.model.entrys];
            } break;
            case ContainerTypeList: {
                _height = [EntryListView totalHeight:self.model.entrys];
            }
                break;
            case ContainerTypeHori: {
            }
                break;
        }
    }
    return _height;
}

- (UIView *)getContainer {
    if(!_container) {
        switch(self.model.type) {
            case ContainerTypeGrid:{
                _container = [[EntryGridView alloc] initWithModel:[self model2ViewModel:self.model.entrys]];

            }
                break;
            case ContainerTypeList: {
                
                _container = [[EntryListView alloc] initWithModel:[self model2ViewModel:self.model.entrys]];
            }
                break;
                
            case ContainerTypeHori: {
            }
                break;
        }
    }
    
    return _container;
}

- (NSArray *)model2ViewModel:(NSArray<EntryModel *> *)models {
    NSMutableArray *ret = [NSMutableArray array];
    
    for (NSInteger i = 0; i < models.count; ++i) {
        EntryViewModel *viewModel = [[EntryViewModel alloc] init];
        viewModel.model = models[i];
        
        [ret addObject:viewModel];
    }
    
    return ret;
}

@end

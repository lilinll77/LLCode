//
//  MainPageConfigView.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "MainPageConfigView.h"
#import "ContainerConfigModel.h"
#import "ServiceCenter.h"
#import "Viewfactory.h"

@interface MainPageConfigView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *mainView;
@property (nonatomic) MainPageModel *config;
@property (nonatomic) NSMutableArray *viewModelList;

@end


@implementation MainPageConfigView

#pragma mark - == 生命周期 ==

- (instancetype)initWithConfig:(MainPageModel *)config {
    if(self = [super initWithFrame:CGRectZero]) {
        self.config = config;
        [self setUpData];
        [self setUpView];
        
    }
    
    return self;
}

- (void)setUpView {
    [self addSubview:self.mainView];
}

- (void)setUpData {
    
    for (NSInteger i = 0; i < self.config.configs.count; ++i) {
        ContainerConfigModel *containerConfig = self.config.configs[i];
        
        id<IViewfactory> factory = [[ServiceCenter sharedInstance] getSrv:NSStringFromProtocol(@protocol(IViewfactory))];
        ContainerViewModel *viewModel = [factory createContainerViewModel:containerConfig];
        [self.viewModelList addObject:viewModel];
    }
}

- (void)reload {
    [self.mainView reloadData];
}

- (void)layoutSubviews {
    self.mainView.frame = self.bounds;
    [super layoutSubviews];
}

#pragma mark - == UItableview detasource ==

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 这里没考虑cell的复用，如果需要翻页的话需要优化
    
    NSInteger index = indexPath.row;
    ContainerViewModel *viewModel = self.viewModelList[index];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell_%d", viewModel.model.type]];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
        [tableView registerClass:[cell class] forCellReuseIdentifier:[NSString stringWithFormat:@"Cell_%d", viewModel.model.type]];
    }
    // 这里偷懒了，hardcode
    [viewModel getContainer].frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [viewModel height]);
    [cell.contentView addSubview:[viewModel getContainer]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    ContainerViewModel *viewModel = self.viewModelList[index];
    
    return [viewModel height];
}
                                                                                            
#pragma mark - == getter ==

- (UITableView *)mainView {
    
    if(!_mainView) {
        _mainView = [[UITableView alloc] init];
        _mainView.dataSource = self;
        _mainView.delegate = self;
    }
    
    return _mainView;
}

- (NSMutableArray *)viewModelList {
    if(!_viewModelList) {
        _viewModelList = [NSMutableArray array];
    }
    
    return _viewModelList;
}

@end

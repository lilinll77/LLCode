//
//  EntryListView.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "EntryListView.h"
#import "Viewfactory.h"
#import "ListCell.h"

@interface EntryListView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray<EntryViewModel *> *entrys;
@property (nonatomic) UITableView *listView;

@end

@implementation EntryListView

+ (CGFloat)totalHeight:(NSArray<EntryViewModel *> *)entrys {
    return  30.f * entrys.count;
}

- (instancetype)initWithModel:(NSArray<EntryViewModel *> *)entrys {
    
    if(self = [super init]) {
        self.entrys = entrys;
        
        [self setUpView];
    }
    
    return self;
}

- (void)setUpView {
    [self addSubview:self.listView];
}

- (void)layoutSubviews {
    self.listView.frame = self.bounds;
    [super layoutSubviews];
}

#pragma mark - == TableView delegate & datasorce ==

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entrys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identiry = NSStringFromClass([ListCell class]);
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:identiry];
    if(!cell) {
        cell = [[ListCell alloc] init];
        [tableView registerClass:[cell class] forCellReuseIdentifier:identiry];
    }
    
    NSInteger index = indexPath.row;
    if(index < self.entrys.count) {
        [cell setViewModel:self.entrys[index]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    
    if(index < self.entrys.count) {
        [self.entrys[index] router];
    }
}

#pragma mark - == getter ==

- (UITableView *)listView {
    
    if(!_listView) {
        _listView = [[UITableView alloc] init];
        _listView.dataSource = self;
        _listView.delegate = self;
    }
    
    return _listView;
}

@end

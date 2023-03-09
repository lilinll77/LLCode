//
//  HoriView.m
//  THSDemo
//
//  Created by lilinli on 2023/3/9.
//

#import "EntryHoriView.h"
#import "HoriCell.h"

@interface EntryHoriView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) NSArray<EntryViewModel *> *entrys;
@property (nonatomic) UICollectionView *gridView;

@end

@implementation EntryHoriView

+ (CGFloat)totalHeight:(NSArray<EntryViewModel *> *)entrys {
    CGFloat ret = 60.f * (entrys.count / 2);
    if(entrys.count % 2 != 0) {
        ret += 60.f;
    }
    
    return ret;
}

- (instancetype)initWithModel:(NSArray<EntryViewModel *> *)entrys {
    
    if(self = [super init]) {
        self.entrys = entrys;
        
        [self setUpView];
    }
    
    return self;
}

- (void)setUpView {
    [self addSubview:self.gridView];
}

- (void)layoutSubviews {
    self.gridView.frame = self.bounds;
    [super layoutSubviews];
}

#pragma mark - == datasource ==

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.entrys.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identiry = NSStringFromClass([HoriCell class]);
    HoriCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identiry forIndexPath:indexPath];
    if(!cell) {
        cell = [[HoriCell alloc] init];
        [collectionView registerClass:[cell class] forCellWithReuseIdentifier:identiry];
    }
    
    NSInteger index = indexPath.row;
    if(index < self.entrys.count) {
        [cell setViewModel:self.entrys[index]];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat itemWidth = screenWidth / 2;
    return CGSizeMake(itemWidth, 60.f);
}

#pragma mark - == getter ==

- (UICollectionView *)gridView {
    
    if(!_gridView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
           [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _gridView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _gridView.dataSource = self;
        _gridView.delegate = self;
        [_gridView registerClass:[HoriCell class] forCellWithReuseIdentifier:NSStringFromClass([HoriCell class])];
    }
    
    return _gridView;
}

@end

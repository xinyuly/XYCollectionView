//
//  XYCollectionAgent.m
//  XYCollectionView
//
//  Created by smok on 16/10/18.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import "XYCollectionViewAgent.h"

@implementation XYCollectionViewAgent

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.collectionView];
        self.collectionView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    
}
#pragma mark - Methods
- (void)appendSection:(XYSection *)section {
    [self.dataSource addObject:section];
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
}

- (void)registerClass:(Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerClass:viewClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier];
}

- (void)registerNib:(UINib *)nib forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerNib:nib forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
}

- (void)insertCell:(XYCell *)cell atIndexPath:(NSIndexPath *)indexPath {
     XYSection *sectionView = [self.dataSource objectAtIndex:indexPath.section];
    [sectionView.cellList insertObject:cell atIndex:indexPath.item];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
}

- (void)deleteCellAtIndexPath:(NSIndexPath *)indexPath {
    XYSection *sectionView = [self.dataSource objectAtIndex:indexPath.section];
    [sectionView.cellList removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

- (void)reloadData {
    [self.collectionView reloadData];
}
#pragma mark - CollectionViewDataSource & delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    XYSection *sectionView = [self.dataSource objectAtIndex:section];
    return sectionView.cellList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYSection *sectionView = [self.dataSource objectAtIndex:indexPath.section];
    XYCell *xyCell = sectionView.cellList[indexPath.item];
    UICollectionViewCell *cell =  xyCell.cellAtIndexPath(collectionView,indexPath);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    XYSection *sectionView = [self.dataSource objectAtIndex:indexPath.section];
     XYCell *xyCell = sectionView.cellList[indexPath.item];
    if (xyCell.didSelectRowAtIndexPathBlock) {
        xyCell.didSelectRowAtIndexPathBlock(collectionView, indexPath);
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    XYSection *sectionView = [self.dataSource objectAtIndex:indexPath.section];
    UICollectionReusableView *view = sectionView.headerAndFooter(collectionView,kind,indexPath);
    return view;
}

#pragma mark - UICollectionViewLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYSection *sectionView = [self.dataSource objectAtIndex:indexPath.section];
    self.flowLayout.sectionInset = sectionView.sectionInset;
    self.flowLayout.sectionHeadersPinToVisibleBounds = sectionView.sectionHeadersPinToVisibleBounds ;
    self.flowLayout.sectionFootersPinToVisibleBounds = sectionView.sectionFootersPinToVisibleBounds;
    self.flowLayout.minimumLineSpacing = (sectionView.minimumLineSpacing ? sectionView.minimumLineSpacing : 10);
    self.flowLayout.minimumInteritemSpacing = (sectionView.minimumInteritemSpacing ? sectionView.minimumInteritemSpacing :10 );
    return sectionView.itemSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    XYSection *sectionView = [self.dataSource objectAtIndex:section];
    return sectionView.headerSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section  {
    XYSection *sectionView = [self.dataSource objectAtIndex:section];
    return sectionView.footerSize;
}
#pragma mark - Getters & Setters
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate   = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end

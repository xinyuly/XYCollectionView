//
//  XYCollectionAgent.h
//  XYCollectionView
//
//  Created by smok on 16/10/18.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYSection.h"
#import "XYCell.h"

@interface XYCollectionViewAgent : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)appendSection:(XYSection *)section;

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString *)identifier;

- (void)insertCell:(XYCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)deleteCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)reloadData;
@end

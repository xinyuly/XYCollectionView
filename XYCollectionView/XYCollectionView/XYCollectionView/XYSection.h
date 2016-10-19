//
//  XYSection.h
//  XYCollectionView
//
//  Created by smok on 16/10/18.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYCell;
typedef UICollectionReusableView*(^XYSectionHeaderAndFooter)(UICollectionView *collectionView,NSString *kind,NSIndexPath *indexPath);
@interface XYSection : NSObject

@property (nonatomic, strong) NSMutableArray *cellList;
@property (nonatomic, strong) XYCell *cell;
@property (nonatomic, copy)   XYSectionHeaderAndFooter headerAndFooter;

@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@property (nonatomic, assign) CGSize headerSize;
@property (nonatomic, assign) CGSize footerSize;

@property (nonatomic, assign) BOOL sectionHeadersPinToVisibleBounds;
@property (nonatomic, assign) BOOL sectionFootersPinToVisibleBounds;

- (void)insertCell:(XYCell *)cell atIndex:(NSInteger )index;
- (void)insertCell:(XYCell *)cell;//加到最后
- (void)removeCellAtIndex:(NSInteger)index;

@end

//
//  XYCell.h
//  XYCollectionView
//
//  Created by smok on 16/10/18.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef UICollectionViewCell*(^XYCollectionViewCellAtIndexPathBlock) (UICollectionView *collectionView, NSIndexPath *indexPath);
typedef void(^XYCollectionViewCellDidSelectRowAtIndexPathBlock)(UICollectionView *collectionView, NSIndexPath *indexPath);

@interface XYCell : NSObject

@property (nonatomic, copy) XYCollectionViewCellAtIndexPathBlock cellAtIndexPath;
@property (nonatomic, copy) XYCollectionViewCellDidSelectRowAtIndexPathBlock didSelectRowAtIndexPathBlock;

@end

//
//  XYSection.m
//  XYCollectionView
//
//  Created by smok on 16/10/18.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import "XYSection.h"

@implementation XYSection

- (void)insertCell:(XYCell *)cell atIndex:(NSInteger )index {
    if (cell) {
        [self.cellList insertObject:cell atIndex:index];
    }
}

- (void)insertCell:(XYCell *)cell {
    [self.cellList insertObject:cell atIndex:self.cellList.count];
}

- (void)removeCellAtIndex:(NSInteger)index {
    [self.cellList removeObjectAtIndex:index];
}
#pragma mark - setter & getter
- (NSMutableArray *)cellList {
    if (_cellList == nil) {
        _cellList = [NSMutableArray array];
    }
    return _cellList;
}
@end

//
//  testCell.m
//  XYCollectionView
//
//  Created by smok on 16/10/19.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
    self.contentView.layer.borderWidth = 1;
}
@end

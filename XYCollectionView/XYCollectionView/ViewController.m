//
//  ViewController.m
//  XYCollectionView
//
//  Created by smok on 16/10/18.
//  Copyright © 2016年 www.xinyuly.com. All rights reserved.
//

#import "ViewController.h"
#import "XYCollectionViewAgent.h"
#import "TestCell.h"

@interface ViewController ()
@property (nonatomic, strong) XYCollectionViewAgent *collectionViewAgent;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionViewAgent = [[XYCollectionViewAgent alloc] init];
    [self.view addSubview:self.collectionViewAgent];
    self.collectionViewAgent.frame = self.view.bounds;
    [self.collectionViewAgent registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellWithReuseIdentifier:@"testCell"];
    [self.collectionViewAgent registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self section0];
    [self section1];
    [self section2];
}

- (void)section0 {
    XYSection *sectionView = [[XYSection alloc] init];
    XYCell *cell10 = [self cellWithTitle:@"10" didSelectBlock:^{
        NSLog(@"我是10");
    }];
    [sectionView insertCell:cell10 atIndex:0];
    XYCell *cell11 = [self cellWithTitle:@"点我删除" didSelectBlock:^{
        NSLog(@"我是11");
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sectionView.cellList.count-1 inSection:0];
        [self.collectionViewAgent deleteCellAtIndexPath:indexPath];
    }];
    [sectionView insertCell:cell11 atIndex:1];
    XYCell *cell12 = [self cellWithTitle:@"点我添加" didSelectBlock:^{
        NSLog(@"我是12");
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sectionView.cellList.count inSection:0];
        [self.collectionViewAgent insertCell:cell10 atIndexPath:indexPath];
    }];
    sectionView.itemSize = CGSizeMake(80, 80);
    [sectionView insertCell:cell12 atIndex:2];
    sectionView.sectionInset = UIEdgeInsetsMake(40, 5, 5, 5);
    [self.collectionViewAgent appendSection:sectionView];
}

- (void)section1 {
    XYSection *sectionView = [[XYSection alloc] init];
    XYCell *cell = [self cellWithTitle:@"0" didSelectBlock:^{
        NSLog(@"我是0");
    }];
    [sectionView insertCell:cell atIndex:0];
    XYCell *cell1 = [self cellWithTitle:@"1" didSelectBlock:^{
        NSLog(@"我是1");
    }];
    [sectionView insertCell:cell1 atIndex:1];
    XYCell *cell2 = [self cellWithTitle:@"2" didSelectBlock:^{
        NSLog(@"我是2");
    }];
    [sectionView insertCell:cell2 atIndex:2];
    
    XYCell *cell3 = [self cellWithTitle:@"3" didSelectBlock:^{
        NSLog(@"我是3");
    }];
    [sectionView insertCell:cell3 atIndex:3];
    XYCell *cell4 = [self cellWithTitle:@"0" didSelectBlock:^{
        NSLog(@"我是0");
    }];
    [sectionView insertCell:cell4 atIndex:4];
    XYCell *cell5 = [self cellWithTitle:@"1" didSelectBlock:^{
        NSLog(@"我是1");
    }];
    [sectionView insertCell:cell5 atIndex:5];
    XYCell *cell6 = [self cellWithTitle:@"2" didSelectBlock:^{
        NSLog(@"我是2");
    }];
    [sectionView insertCell:cell6 atIndex:6];
    
    XYCell *cell7 = [self cellWithTitle:@"3" didSelectBlock:^{
        NSLog(@"我是3");
    }];
    [sectionView insertCell:cell7 atIndex:7];
    sectionView.headerAndFooter = ^UICollectionReusableView*(UICollectionView *collectionView,NSString *kind,NSIndexPath *indexPath) {
        UICollectionReusableView *header = nil;
        if (kind == UICollectionElementKindSectionHeader) {
            header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
            UILabel *labbel = [[UILabel alloc] init];
            labbel.text = @"我是Header";
            [header addSubview:labbel];
            labbel.frame = header.bounds;
        }
        return header;
    };
    sectionView.headerSize = CGSizeMake(100, 40);
    sectionView.itemSize = CGSizeMake(120, 100);
    sectionView.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
    [self.collectionViewAgent appendSection:sectionView];
}

- (void)section2 {
    XYSection *sectionView = [[XYSection alloc] init];
    XYCell *cell20 = [self cellWithTitle:@"20" didSelectBlock:^{
        NSLog(@"我是20");
    }];
    [sectionView insertCell:cell20 atIndex:0];
    XYCell *cell21 = [self cellWithTitle:@"21" didSelectBlock:^{
        NSLog(@"我是21");
    }];
    [sectionView insertCell:cell21 atIndex:1];
    XYCell *cell22 = [self cellWithTitle:@"22" didSelectBlock:^{
        NSLog(@"我是22");
    }];
    [sectionView insertCell:cell22 atIndex:2];
    sectionView.itemSize = CGSizeMake(self.view.bounds.size.width-20, 150);
    sectionView.sectionInset = UIEdgeInsetsMake(40, 5, 5, 5);
    [self.collectionViewAgent appendSection:sectionView];
}

- (XYCell *)cellWithTitle:(NSString *)title didSelectBlock:(void (^)())block {
    XYCell *cell = [[XYCell alloc] init];
    cell.cellAtIndexPath = ^UICollectionViewCell*(UICollectionView *collectionView ,NSIndexPath *indexPath) {
        TestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell" forIndexPath:indexPath];
        cell.title.text = title;
        return cell;
    };
    cell.didSelectRowAtIndexPathBlock = ^(UICollectionView *collectionView ,NSIndexPath *indexPath) {
        if (block) {
            block();
        }
    };
    return cell;
}

@end

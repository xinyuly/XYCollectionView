# XYCollectionView
对collectionView的封装，能简单方便随时改变section或者cell的位置。在实现九宫格类型的视图且每个cell的点击事件不同时使用XYCollectionView会更方便
说明：
```objc
//改变该三句代码的顺序即可交换section的位置
[self section0];
[self section1];
[self section2];
```


```objc
//添加cell
[self.collectionViewAgent insertCell:cell atIndexPath:indexPath];
```

![image](https://github.com/xinyuly/XYCollectionView/new/master/an.gif)

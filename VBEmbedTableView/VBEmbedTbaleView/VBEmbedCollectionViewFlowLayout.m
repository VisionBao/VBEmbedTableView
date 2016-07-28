//
//  VBEmbedCollectionViewFlowLayout.m
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBEmbedCollectionViewFlowLayout.h"
//CollectionView 宽度
#define WIDTH ([UIScreen mainScreen].bounds.size.width - 2 * 10 - 20 - 50)

@interface VBEmbedCollectionViewFlowLayout ()
//临时保存item的总宽度
@property (nonatomic, assign) CGFloat columnWidth;
//记录一共有多少行
@property (nonatomic, assign) NSInteger columnNumber;
//保存每一个item x y w h
@property (nonatomic, retain) NSMutableArray *arrForItemAtrributes;
//保存item总数
@property (nonatomic,assign) NSUInteger numberOfItems;
// 保存每个item的X值
@property (nonatomic, assign) CGFloat xForItemOrigin;
// 保存每个item的Y值
@property (nonatomic, assign) CGFloat yForItemOrigin;

@end


@implementation VBEmbedCollectionViewFlowLayout

// 准备布局
- (void)prepareLayout {
    
    [super prepareLayout];
    
    self.columnWidth = self.insertItemSpacing;
    self.columnNumber = 0;
    self.arrForItemAtrributes = [NSMutableArray array];
    self.xForItemOrigin = self.insertItemSpacing;
    self.yForItemOrigin = self.insertItemSpacing;
    
    //获取item的个数
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    /** 为每个item确定LayoutAttribute属性,同时将这些属性放入布局数组中 */
    for(int i = 0;i < self.numberOfItems;i++)
    {
        /** 确定每个Item的indexPath属性 */
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        /** 确定每个item的origin的x,y值 */
        /** 确定每个Item的frame属性,同时确定了每个Item的LayoutAttribute,放入到了布局属性数组中 */
        [self setFrame:indexPath];
    }
    
}
// 计算contentView的大小
- (CGSize)collectionViewContentSize
{
    // 获取collectionView的Size
    CGSize contentSize = self.collectionView.frame.size;
    // 最大高度+bottom
    contentSize.height = self.insertItemSpacing + (self.itemSize.height + self.insertItemSpacing) * (self.columnNumber + 1);
    //设置collectionView的大小自适应
    self.collectionView.frame = CGRectMake(self.collectionView.frame.origin.x, self.collectionView.frame.origin.y, contentSize.width, contentSize.height);
    return contentSize;
}

// 返回每一个item的attribute
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 返回每一个item的Attribute
    return self.arrForItemAtrributes;
}

// 设置属性和frame
- (void)setFrame:(NSIndexPath *)indexPath
{
    // 设置Item LayoutAttribute 属性
    UICollectionViewLayoutAttributes *layoutArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // 获取item的高
    CGFloat itemWidth = 0;
    if (_delegate && [_delegate respondsToSelector:@selector(widthForItemIndexPath:AndCollectioinView:)]) {
        // 使用代理方法获取item的高
        itemWidth = [_delegate widthForItemIndexPath:indexPath AndCollectioinView:self.collectionView];
    }
    //之前item的宽总和 + 当前item的宽 + 间距 < 屏幕总款
    if (self.columnWidth + itemWidth + self.insertItemSpacing < WIDTH) {
        //设置x
        self.xForItemOrigin = self.columnWidth;
        self.columnWidth += itemWidth + self.insertItemSpacing;
    }else {
        self.xForItemOrigin = self.insertItemSpacing;
        //如果宽度超过屏幕从新计算宽度
        self.columnWidth = itemWidth + self.insertItemSpacing * 2;
        self.columnNumber++;
    }
    // 计算是第几行 乘以高度
    self.yForItemOrigin = self.insertItemSpacing + (self.itemSize.height + self.insertItemSpacing) * self.columnNumber;
    
    // 设置frame
    layoutArr.frame = CGRectMake(self.xForItemOrigin, self.yForItemOrigin, itemWidth, self.itemSize.height);
    // 放入数组
    [self.arrForItemAtrributes addObject:layoutArr];
}
+ (CGFloat)hightForCollection:(NSArray <NSString*>*)array{
    /***待完善*/
    CGSize itemSize = CGSizeMake(0, 17);
    CGFloat insertItemSpacing = 10;
    /********/
    //总高度
    CGFloat totalHight = 0;
    //行数计数
    NSInteger columnNumber = 1;
    //临时宽度
    CGFloat columnWidth = 0;
    
    CGFloat xForItemOrigin = insertItemSpacing;
    
    int i = 0;
    
    for (NSString *tag in array) {
        NSString *content = array[i];
        CGRect itemFrame = [content boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
        
        CGFloat width = itemFrame.size.width + 10;
        
        if (columnWidth + width + insertItemSpacing < WIDTH) {
            xForItemOrigin = columnWidth;
            columnWidth += width + insertItemSpacing;
        }else {
            xForItemOrigin = insertItemSpacing;
            columnWidth = width + insertItemSpacing * 2;
            columnNumber++;
        }
        i++;
    }
    
    
    
    totalHight = columnNumber * itemSize.height + insertItemSpacing * (columnNumber + 3);
    return totalHight;
}
@end

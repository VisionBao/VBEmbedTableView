//
//  VBEmbedCollectionViewFlowLayout.h
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VBEmbedCollectionViewFlowLayoutDelegate <NSObject>

- (CGFloat)widthForItemIndexPath:(NSIndexPath *)indexPath AndCollectioinView:(UICollectionView *)collectionView;

@end

@interface VBEmbedCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) id<VBEmbedCollectionViewFlowLayoutDelegate>delegate;

//间距
@property (nonatomic,assign)CGFloat insertItemSpacing;

+ (CGFloat)hightForCollection:(NSArray <NSString*>*)array;
@end

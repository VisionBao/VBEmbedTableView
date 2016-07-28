//
//  VBEmbedTableView.h
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBEmbedTableView : UIView
/**
 *  e.g. [@"A", @"B"...]
 */
@property (nonatomic, strong) NSArray<NSString *> *titleArray;
/**
 *  e.g. [@[@"A", @"B"], @[@"A", @"C"],...]
 */
@property (nonatomic, strong) NSArray<NSArray *> *tagArray;

//使用该初始化方法初始化
+ (instancetype)embedTableViewWithFrame:(CGRect)frame;
- (instancetype)initEmbedTableViewWithFrame:(CGRect)frame;
//刷新数据源
- (void)reloadData;

@end

//
//  VBEmbedTableView.m
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBEmbedTableView.h"
#import "VBEmbedTableViewCell.h"
#import "VBEmbedCollectionViewFlowLayout.h"

@interface VBEmbedTableView ()<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation VBEmbedTableView

+ (instancetype)embedTableViewWithFrame:(CGRect)frame{
    return [[self alloc] initEmbedTableViewWithFrame:frame];
}

- (instancetype)initEmbedTableViewWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [self addSubview:_mainTableView];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (VBEmbedTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"VBEmbedTableViewCell";
    VBEmbedTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[VBEmbedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [cell initEmbedtableViewCellWithTitle:_titleArray[indexPath.row] tagArray:_tagArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [VBEmbedCollectionViewFlowLayout hightForCollection:_tagArray[indexPath.row]];
}

- (void)reloadData
{
    if (_titleArray.count == _tagArray.count) {
        
        [_mainTableView reloadData];
    }
}

- (void)setTitleArray:(NSArray<NSString *> *)titleArray
{
    if (titleArray.count != 0) {
        _titleArray = titleArray;
        [self reloadData];
    }
}

- (void)setTagArray:(NSArray<NSArray *> *)tagArray
{
    if (tagArray.count != 0) {
        _tagArray = tagArray;
        [self reloadData];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

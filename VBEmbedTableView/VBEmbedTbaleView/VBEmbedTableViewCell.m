//
//  VBEmbedTableViewCell.m
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "Masonry.h"
#import "VBEmbedTableViewCell.h"
#import "VBEmbedCollectionViewCell.h"
#import "VBEmbedCollectionViewFlowLayout.h"

@interface VBEmbedTableViewCell ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
VBEmbedCollectionViewFlowLayoutDelegate
>


@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UICollectionView *mainCollectionView;

//temp
@property (nonatomic, strong) NSArray *tagArr;

@end

@implementation VBEmbedTableViewCell

- (void)initEmbedtableViewCellWithTitle:(NSString *)title tagArray:(NSArray<NSString *> *)tagArray
{
    _titleLable.text = title;
    _tagArr = tagArray;
    [_mainCollectionView reloadData];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLable = [[UILabel alloc] init];
        /********自定义title样式*************/
        _titleLable.textColor = [UIColor blackColor];
        /***************************/
        [self.contentView addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@20);
            make.left.mas_equalTo(@20);
            make.size.mas_equalTo(CGSizeMake(50, 20));
        }];
        /***待完善
         ---修改此部分需同步修改  VBEmbedCollectionViewFlowLayout.m中
        + (CGFloat)hightForCollection:(NSArray <NSString*>*)array;
         ********/
        VBEmbedCollectionViewFlowLayout *flowLayout = [[VBEmbedCollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(0, 17);
        flowLayout.delegate = self;
        flowLayout.insertItemSpacing = 10;
        
    
        static NSString *identify = @"VBEmbedCollectionViewCell";
        
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.scrollEnabled = NO;
        [_mainCollectionView registerClass:[VBEmbedCollectionViewCell class] forCellWithReuseIdentifier:identify];
        [self.contentView addSubview:_mainCollectionView];
        [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@10);
            make.left.equalTo(_titleLable.mas_right).offset(10);
            make.right.mas_equalTo(@-10);
            make.bottom.mas_equalTo(@-10);
        }];
        
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tagArr.count;
}


- (VBEmbedCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"VBEmbedCollectionViewCell";
    VBEmbedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.tagStr = _tagArr[indexPath.item];
    return cell;
    
}

- (CGFloat)widthForItemIndexPath:(NSIndexPath *)indexPath AndCollectioinView:(UICollectionView *)collectionView{
    /***待完善
     ---修改此部分需同步修改  VBEmbedCollectionViewFlowLayout.m中
     + (CGFloat)hightForCollection:(NSArray <NSString*>*)array;
     ********/
    NSString *content = self.tagArr[indexPath.item];
    CGRect itemFrame = [content boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    
    CGFloat width = itemFrame.size.width + 10;
    return width;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  VBEmbedCollectionViewCell.m
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBEmbedCollectionViewCell.h"
#import "Masonry.h"

@interface VBEmbedCollectionViewCell ()

@property (nonatomic, strong) UILabel *tagLabel;

@end

@implementation VBEmbedCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tagLabel = [[UILabel alloc] init];
        /********自定义title样式*************/
        _tagLabel.textColor = [UIColor blackColor];
        /***************************/
        [self.contentView addSubview:_tagLabel];
        
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)setTagStr:(NSString *)tagStr
{
    _tagStr = tagStr;
    _tagLabel.text = _tagStr;
}
@end

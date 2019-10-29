//
//  WDTimeLinePureImageTableViewCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/29.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLinePureImageTableViewCell.h"
#import "WDTimeLineImageLoadView.h"

@interface WDTimeLinePureImageTableViewCell ()
@property (nonatomic, strong) WDTimeLineImageLoadView *imageLoadView;
@property (nonatomic, strong) NSArray<NSString *> *imageArray;
@end

@implementation WDTimeLinePureImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageLoadView = [[WDTimeLineImageLoadView alloc] init];
        [self.contentView addSubview:self.imageLoadView];
    }
    return self;
}

- (void)setImagesArray:(NSArray<NSString *> *)imagesArray {
    _imagesArray = imagesArray;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self.imagesArray count] == 1) {
        [self.imageLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.userNickNameLabel);
            make.top.mas_equalTo(self.userHeaderImageView.mas_centerY).mas_offset(7.5);
            make.bottom.mas_equalTo(self.articleInfoLabel.mas_top).mas_offset(-kIMAGERVIEW_BOTTOM_SAPCE);
            make.width.mas_equalTo(224);
        }];
    } else if ([self.imagesArray count] == 4) {
        [self.imageLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.userNickNameLabel);
            make.top.mas_equalTo(self.userHeaderImageView.mas_centerY).mas_offset(7.5);
            make.width.mas_equalTo(kIMAGERVIEW_WIDTH * 2 + kIMAGERVIEW_ITEM_MARGIN);
            make.bottom.mas_equalTo(self.articleInfoLabel.mas_top).mas_offset(-kIMAGERVIEW_BOTTOM_SAPCE);
        }];
    } else {
        [self.imageLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.userNickNameLabel);
            make.top.mas_equalTo(self.userHeaderImageView.mas_centerY).mas_offset(7.5);
            if ([self.imagesArray count] <= 3) {
                make.width.mas_equalTo(kIMAGERVIEW_WIDTH * [self.imagesArray count] + kIMAGERVIEW_ITEM_MARGIN * ([self.imagesArray count] - 1));
            } else {
                make.width.mas_equalTo(kIMAGERVIEW_WIDTH * 3 + kIMAGERVIEW_ITEM_MARGIN * 2);
            }
            make.bottom.mas_equalTo(self.articleInfoLabel.mas_top).mas_offset(-kIMAGERVIEW_BOTTOM_SAPCE);
        }];
    }
    
    [self.imageLoadView layoutIfNeeded];
    [self.imageLoadView loadImages:self.imagesArray];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

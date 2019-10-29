//
//  WDTimeLineTableViewCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/29.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineTableViewCell.h"
#import "WDTimeLineImageLoadView.h"

@interface WDTimeLineTableViewCell ()
@property (nonatomic, strong) WDTimeLineImageLoadView *imageLoadView;
@property (nonatomic, strong) NSArray<NSString *> *imageArray;
@end

@implementation WDTimeLineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentTextLabel = [[UILabel alloc] init];
        self.contentTextLabel.textColor = kCONTEXT_TEXTCOLOR;
        self.contentTextLabel.numberOfLines = 0;
        self.contentTextLabel.font = kCONTEXT_FONT;
        [self.contentView addSubview:self.contentTextLabel];
        
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
    
    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.userNickNameLabel);
        make.trailing.mas_equalTo(-kVIEW_TRAILING_SPACE);
        make.top.mas_equalTo(self.userHeaderImageView.mas_centerY).mas_offset(7.5);
    }];
    
    if ([self.imagesArray count] == 1) {
        [self.imageLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.userNickNameLabel);
            make.top.mas_equalTo(self.contentTextLabel.mas_bottom).mas_offset(kIMAGERVIEW_TEXT_SAPCE);
            make.bottom.mas_equalTo(self.articleInfoLabel.mas_top).mas_offset(-kIMAGERVIEW_BOTTOM_SAPCE);
            make.width.mas_equalTo(224);
        }];
    } else if ([self.imagesArray count] == 4) {
        [self.imageLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.userNickNameLabel);
            make.top.mas_equalTo(self.contentTextLabel.mas_bottom).mas_offset(kIMAGERVIEW_TEXT_SAPCE);
            make.width.mas_equalTo(kIMAGERVIEW_WIDTH * 2 + kIMAGERVIEW_ITEM_MARGIN);
            make.bottom.mas_equalTo(self.articleInfoLabel.mas_top).mas_offset(-kIMAGERVIEW_BOTTOM_SAPCE);
        }];
    } else {
        [self.imageLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.userNickNameLabel);
            make.top.mas_equalTo(self.contentTextLabel.mas_bottom).mas_offset(kIMAGERVIEW_TEXT_SAPCE);
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

//
//  WDTimeLinePureTextTableViewCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/28.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLinePureTextTableViewCell.h"

@implementation WDTimeLinePureTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentTextLabel = [[UILabel alloc] init];
        self.contentTextLabel.textColor = kCONTEXT_TEXTCOLOR;
        self.contentTextLabel.numberOfLines = 0;
        self.contentTextLabel.font = kCONTEXT_FONT;
        [self.contentView addSubview:self.contentTextLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.userNickNameLabel);
        make.trailing.mas_equalTo(-kVIEW_TRAILING_SPACE);
        make.top.mas_equalTo(self.userHeaderImageView.mas_centerY).mas_offset(7.5);
        make.bottom.mas_equalTo(self.articleInfoLabel.mas_top).mas_offset(-kIMAGERVIEW_BOTTOM_SAPCE);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

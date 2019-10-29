//
//  WDTimeLineBaseTableViewCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/28.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineBaseTableViewCell.h"

@implementation WDTimeLineBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.userHeaderImageView = [[UIImageView alloc] init];
        self.userHeaderImageView.clipsToBounds = YES;
        self.userHeaderImageView.backgroundColor = kIMAGERVIEW_BACKGROUDNCOLOR;
        self.userHeaderImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.userHeaderImageView.layer.cornerRadius = kHEADERIMAGER_RADIUS;
        self.userHeaderImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.userHeaderImageView];
        
        self.userNickNameLabel = [[UILabel alloc] init];
        self.userNickNameLabel.textColor = kNICKNAME_TEXTCOLOR;
        self.userNickNameLabel.font = kNICKNAME_FONT;
        [self.contentView addSubview:self.userNickNameLabel];
        
        self.articleInfoLabel = [[UILabel alloc] init];
        self.articleInfoLabel.textColor = kINFO_TEXTCOLOR;
        self.articleInfoLabel.font = kINFO_FONT;
        [self.contentView addSubview:self.articleInfoLabel];
        
        self.separatLineView = [[UIView alloc] init];
        self.separatLineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        [self.contentView addSubview:self.separatLineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.separatLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.userHeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kHEADERIMAGER_TOP_SPACE);
        make.leading.mas_equalTo(kHEADERIMAGER_LEADING_SPACE);
        make.width.height.mas_equalTo(kHEADERIMAGER_WIDTH);
    }];
    
    [self.userNickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.userHeaderImageView.mas_centerY);
        make.leading.mas_equalTo(self.userHeaderImageView.mas_trailing).mas_offset(kNICKNAME_LEADING_SPACE);
        make.trailing.mas_equalTo(-kVIEW_TRAILING_SPACE);
    }];
    
    [self.articleInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.userNickNameLabel);
        make.trailing.mas_equalTo(-kVIEW_TRAILING_SPACE);
        make.bottom.mas_equalTo(-kINFO_BOTTOM_SAPCE);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

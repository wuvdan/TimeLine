//
//  WDTimeLineTypeSelectCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineTypeSelectCell.h"
#import <Masonry.h>

@interface WDTimeLineTypeSelectCell ()
@property (nonatomic, strong) UIView *bottomLineView;
@end

@implementation WDTimeLineTypeSelectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.bottomLineView = [[UIView alloc] init];
        self.bottomLineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        [self.contentView addSubview:self.bottomLineView];
        
        self.currentTypeImageView = [[UIImageView alloc] init];
        self.currentTypeImageView.image = [UIImage imageNamed:@"icon_post_type"];
        self.currentTypeImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.currentTypeImageView];
        
        self.currentTypeLabel = [[UILabel alloc] init];
        self.currentTypeLabel.text = @"选择分类";
        self.currentTypeLabel.textColor = [UIColor systemBlueColor];
        self.currentTypeLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.currentTypeLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.contentView).inset(25);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.currentTypeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(25 + 10);
        make.centerY.mas_equalTo(0);
        make.height.width.mas_equalTo(25);
    }];
    
    [self.currentTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.currentTypeImageView.mas_trailing).mas_offset(10);
        make.centerY.mas_equalTo(0);
        make.trailing.mas_greaterThanOrEqualTo(-15);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

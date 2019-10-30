//
//  WDTimeLineLocationCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineLocationCell.h"
#import <Masonry.h>

@interface WDTimeLineLocationCell ()
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;
@end

@implementation WDTimeLineLocationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.topLineView = [[UIView alloc] init];
        self.topLineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        [self.contentView addSubview:self.topLineView];
        
        self.bottomLineView = [[UIView alloc] init];
        self.bottomLineView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        [self.contentView addSubview:self.bottomLineView];
        
        self.currentLocationImageView = [[UIImageView alloc] init];
        self.currentLocationImageView.image = [UIImage imageNamed:@"icon_post_local"];
        self.currentLocationImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.currentLocationImageView];
        
        self.currentLocationLabel = [[UILabel alloc] init];
        self.currentLocationLabel.text = @"选择定位地址";
        self.currentLocationLabel.textColor = [UIColor systemBlueColor];
        self.currentLocationLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.currentLocationLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.contentView).inset(25);
        make.top.mas_equalTo(5);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.contentView).inset(25);
        make.bottom.mas_equalTo(-5);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.currentLocationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(25 + 10);
        make.centerY.mas_equalTo(0);
        make.height.width.mas_equalTo(25);
    }];
    
    [self.currentLocationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.currentLocationImageView.mas_trailing).mas_offset(10);
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

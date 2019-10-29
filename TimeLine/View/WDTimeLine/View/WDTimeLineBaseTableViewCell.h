//
//  WDTimeLineBaseTableViewCell.h
//  TimeLine
//
//  Created by Unique on 2019/10/28.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "WDTimeLineConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDTimeLineBaseTableViewCell : UITableViewCell
// 头像
@property (nonatomic, strong) UIImageView *userHeaderImageView;
// 昵称
@property (nonatomic, strong) UILabel *userNickNameLabel;
// 底部信息
@property (nonatomic, strong) UILabel *articleInfoLabel;
// 底部分割线
@property (nonatomic, strong) UIView *separatLineView;

@end

NS_ASSUME_NONNULL_END

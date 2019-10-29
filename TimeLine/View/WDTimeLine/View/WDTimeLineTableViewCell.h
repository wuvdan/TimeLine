//
//  WDTimeLineTableViewCell.h
//  TimeLine
//
//  Created by Unique on 2019/10/29.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDTimeLineTableViewCell : WDTimeLineBaseTableViewCell
/**  说明
 *   需要在图片地址中拼接图片的尺寸信息
 */
@property (nonatomic, copy) NSArray<NSString *> *imagesArray;
@property (nonatomic, strong) UILabel *contentTextLabel;
@end

NS_ASSUME_NONNULL_END

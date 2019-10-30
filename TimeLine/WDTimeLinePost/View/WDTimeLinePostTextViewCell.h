//
//  WDTimeLinePostTextViewCell.h
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WDTimeLinePostTextViewCell;
@protocol WDTimeLinePostTextViewCellDelegate <NSObject>
- (void)postTextViewCell:(WDTimeLinePostTextViewCell *)cell didChangeFrame:(CGRect)frame didChangeText:(NSString *)text;
- (void)postTextViewCell:(WDTimeLinePostTextViewCell *)cell reachedMaxNum:(BOOL)reached;
@end

@interface WDTimeLinePostTextViewCell : UITableViewCell
@property (nonatomic, weak) id <WDTimeLinePostTextViewCellDelegate> delegate;
@property (nonatomic, strong) UITextView *textView;
@end

NS_ASSUME_NONNULL_END

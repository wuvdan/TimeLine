//
//  UITextView+TimeLine.h
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (TimeLine)
- (void)wd_setPlaceholderWithText:(NSString *)text Color:(UIColor *)color;

- (void)was_setFont:(UIFont *)font;

-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;
@end

NS_ASSUME_NONNULL_END

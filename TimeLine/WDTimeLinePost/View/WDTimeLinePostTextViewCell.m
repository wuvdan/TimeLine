//
//  WDTimeLinePostTextViewCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLinePostTextViewCell.h"
#import "UITextView+TimeLine.h"
#import "WDTimeLineConstant.h"

@interface WDTimeLinePostTextViewCell ()<UITextViewDelegate>

@end

@implementation WDTimeLinePostTextViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textView               = [[UITextView alloc] init];
        self.textView.delegate      = self;
        self.textView.scrollEnabled = NO;
        self.textView.font          = kPOST_TEXTVIEW_FONT;
        [self.textView wd_setPlaceholderWithText:kPOST_TEXTVIEW_PLACEHOLDER Color:[UIColor lightGrayColor]];
        self.textView.returnKeyType = UIReturnKeyDone;
        [self.contentView addSubview:self.textView];
        self.textView.frame = CGRectMake(25, 15, UIScreen.mainScreen.bounds.size.width - 50, 100);
    }
    return self;
}

- (void)textViewDidChange:(UITextView *)textView {
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    
    if (textView.text.length > kPOST_TEXTVIEW_MAXNUM) {
        if ([self.delegate respondsToSelector:@selector(postTextViewCell:reachedMaxNum:)]) {
            [self.delegate postTextViewCell:self reachedMaxNum: YES];
        }
        textView.text = [textView.text substringToIndex:kPOST_TEXTVIEW_MAXNUM];
        return;
    }
    
    if (size.height < 100) {
        textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 100);
    } else {
        textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
    }
    
    if ([self.delegate respondsToSelector:@selector(postTextViewCell:didChangeFrame:didChangeText:)]) {
        [self.delegate postTextViewCell:self didChangeFrame:textView.frame didChangeText:textView.text];
    }
}

#pragma mark - 计算文字高度
- (CGSize)sizeForLblContent:(NSString *)strContent fixMaxWidth:(CGFloat)w andFondSize:(int)fontSize {
    UIFont *font          = [UIFont systemFontOfSize:fontSize];
    NSDictionary *dicAttr = [[NSDictionary alloc] initWithObjectsAndKeys:font,NSFontAttributeName, nil];
    CGSize size = [strContent boundingRectWithSize:CGSizeMake(w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dicAttr context:nil].size;
    return size;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (UITableView *)tableView {
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

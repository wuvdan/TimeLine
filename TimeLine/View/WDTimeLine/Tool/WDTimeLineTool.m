//
//  WDTimeLineTool.m
//  TimeLine
//
//  Created by Unique on 2019/10/28.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineTool.h"
#import "WDTimeLineConstant.h"

@implementation WDTimeLineTool

+ (CGFloat)heightOfText:(NSString *)text maxWidth:(CGFloat)width textFont:(UIFont *)font {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing: 2.0f];
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style}
                                     context:nil];

    return  rect.size.height;
}

+ (CGFloat)pureTextHeightOfText:(NSString *)text {
    CGFloat infoHeight = [WDTimeLineTool heightOfText:@"1W阅读    998点赞    765评论    1小时前"
                                             maxWidth:[[UIScreen mainScreen] bounds].size.width - (kHEADERIMAGER_LEADING_SPACE + kVIEW_TRAILING_SPACE + kHEADERIMAGER_WIDTH + kNICKNAME_LEADING_SPACE)
                                             textFont:kINFO_FONT];
    CGFloat textHeight = [WDTimeLineTool heightOfText:text
                                             maxWidth:[[UIScreen mainScreen] bounds].size.width - (kHEADERIMAGER_LEADING_SPACE + kVIEW_TRAILING_SPACE + kHEADERIMAGER_WIDTH + kNICKNAME_LEADING_SPACE)
                                             textFont:kCONTEXT_FONT];
    CGFloat topHeight = kHEADERIMAGER_TOP_SPACE + kHEADERIMAGER_WIDTH / 2 + 7.5;
    CGFloat margin = kIMAGERVIEW_BOTTOM_SAPCE + kINFO_BOTTOM_SAPCE;
    return topHeight + margin + infoHeight + textHeight;

}

+ (CGFloat)pureImageHeightOfImages:(NSArray<NSString *> *)images {
    CGFloat infoHeight = [WDTimeLineTool heightOfText:@"1W阅读    998点赞    765评论    1小时前"
                                             maxWidth:[[UIScreen mainScreen] bounds].size.width - (kHEADERIMAGER_LEADING_SPACE + kVIEW_TRAILING_SPACE + kHEADERIMAGER_WIDTH + kNICKNAME_LEADING_SPACE)
                                             textFont:kINFO_FONT];
    
    CGFloat topHeight = kHEADERIMAGER_TOP_SPACE + kHEADERIMAGER_WIDTH / 2 + 7.5;
    CGFloat margin = kIMAGERVIEW_BOTTOM_SAPCE + kINFO_BOTTOM_SAPCE;
    
    if ([images count] == 1) {
        return topHeight + margin + 224 + infoHeight;
    } else if ([images count] == 4) {
        return topHeight + margin + (kIMAGERVIEW_WIDTH * 2 + kIMAGERVIEW_ITEM_MARGIN) + infoHeight;
    } else if ([images count] <= 3) {
        return topHeight + margin + kIMAGERVIEW_WIDTH + infoHeight;
    } else if ([images count] <= 6) {
        return topHeight + margin + kIMAGERVIEW_WIDTH * 2 + kIMAGERVIEW_ITEM_MARGIN + infoHeight;
    } else{
        return topHeight + margin + kIMAGERVIEW_WIDTH * 3 + kIMAGERVIEW_ITEM_MARGIN * 2 + infoHeight;
    }
}

+ (CGFloat)normalHeightWithImages:(NSArray<NSString *> *)images text:(NSString *)text {
    CGFloat infoHeight = [WDTimeLineTool heightOfText:@"1W阅读    998点赞    765评论    1小时前"
                                             maxWidth:[[UIScreen mainScreen] bounds].size.width - (kHEADERIMAGER_LEADING_SPACE + kVIEW_TRAILING_SPACE + kHEADERIMAGER_WIDTH + kNICKNAME_LEADING_SPACE)
                                             textFont:kINFO_FONT];
    CGFloat textHeight = [WDTimeLineTool heightOfText:text
                                             maxWidth:[[UIScreen mainScreen] bounds].size.width - (kHEADERIMAGER_LEADING_SPACE + kVIEW_TRAILING_SPACE + kHEADERIMAGER_WIDTH + kNICKNAME_LEADING_SPACE)
                                             textFont:kCONTEXT_FONT];
    CGFloat topHeight = kHEADERIMAGER_TOP_SPACE + kHEADERIMAGER_WIDTH / 2 + 7.5;
    CGFloat margin = kIMAGERVIEW_BOTTOM_SAPCE + kINFO_BOTTOM_SAPCE;
    CGFloat space = kIMAGERVIEW_TEXT_SAPCE;

    if ([images count] == 1) {
        return topHeight + margin + 224 + infoHeight + textHeight + space;
    } else if ([images count] == 4) {
        return topHeight + margin + (kIMAGERVIEW_WIDTH * 2 + kIMAGERVIEW_ITEM_MARGIN) + infoHeight + textHeight + space;
    } else if ([images count] <= 3) {
        return topHeight + margin + kIMAGERVIEW_WIDTH + infoHeight + textHeight + space;
    } else if ([images count] <= 6) {
        return topHeight + margin + kIMAGERVIEW_WIDTH * 2 + kIMAGERVIEW_ITEM_MARGIN + infoHeight + textHeight + space;
    } else{
        return topHeight + margin + kIMAGERVIEW_WIDTH * 3 + kIMAGERVIEW_ITEM_MARGIN * 2 + infoHeight + textHeight + space;
    }
}
@end

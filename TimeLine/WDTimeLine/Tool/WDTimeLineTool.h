//
//  WDTimeLineTool.h
//  TimeLine
//
//  Created by Unique on 2019/10/28.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDTimeLineTool : NSObject
+ (CGFloat)heightOfText:(NSString *)text maxWidth:(CGFloat)width textFont:(UIFont *)font;

+ (CGFloat)pureTextHeightOfText:(NSString *)text;
+ (CGFloat)pureImageHeightOfImages:(NSArray<NSString *> *)images;
+ (CGFloat)normalHeightWithImages:(NSArray<NSString *> *)images text:(NSString *)text;
@end

NS_ASSUME_NONNULL_END

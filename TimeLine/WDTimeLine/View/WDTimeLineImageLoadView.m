//
//  WDTimeLineImageLoadView.m
//  TimeLine
//
//  Created by Unique on 2019/10/29.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineImageLoadView.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>
#import <FLAnimatedImage.h>
#import "WDTimeLineConstant.h"
#import "HZPhotoBrowser.h"

@interface WDTimeLineImageLoadView ()<HZPhotoBrowserDelegate>

@property (nonatomic, strong) NSMutableArray<UIImageView *> *imageViewArray;
@property (nonatomic, copy) NSArray<NSString *> *imageURLs;

@end

@implementation WDTimeLineImageLoadView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)loadImages:(NSArray<NSString *> *)images {
    self.imageURLs = images;
    self.imageViewArray = [NSMutableArray array];
    [images enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 8000 + idx;
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = kIMAGERVIEW_BACKGROUDNCOLOR;
        imageView.image = nil;
        imageView.layer.cornerRadius = kIMAGERVIEW_RADIUS;
        imageView.layer.masksToBounds = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:kIMAGERVIEW_PLACEHOLDER_IMAGENAME]];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGuestureAction:)]];
        [self.imageViewArray addObject:imageView];
    }];
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag >= 8000) {
            [obj removeFromSuperview];
        }
    }];
    
    if ([images count] == 1) {
        UIImageView *imgView = self.imageViewArray.firstObject;
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    } else if ([images count] == 4) {
        [self masLayoutSubViewsWithViewArray:self.imageViewArray
                                 columnOfRow:2
                       topBottomOfItemSpeace:kIMAGERVIEW_ITEM_MARGIN
                         leftRightItemSpeace:kIMAGERVIEW_ITEM_MARGIN
                        topOfSuperViewSpeace:0
                    leftRightSuperViewSpeace:0
                             addToSubperView:self
                                  viewHeight:kIMAGERVIEW_WIDTH];
    } else if ([images count] == 2) {
        [self masLayoutSubViewsWithViewArray:self.imageViewArray
                                 columnOfRow:2
                       topBottomOfItemSpeace:kIMAGERVIEW_ITEM_MARGIN
                         leftRightItemSpeace:kIMAGERVIEW_ITEM_MARGIN
                        topOfSuperViewSpeace:0
                    leftRightSuperViewSpeace:0
                             addToSubperView:self
                                  viewHeight:kIMAGERVIEW_WIDTH];
    } else {        
        [self masLayoutSubViewsWithViewArray:self.imageViewArray
                                 columnOfRow:3
                       topBottomOfItemSpeace:kIMAGERVIEW_ITEM_MARGIN
                         leftRightItemSpeace:kIMAGERVIEW_ITEM_MARGIN
                        topOfSuperViewSpeace:0
                    leftRightSuperViewSpeace:0
                             addToSubperView:self
                                  viewHeight:kIMAGERVIEW_WIDTH];
    }
}

- (void)tapGuestureAction:(UITapGestureRecognizer *)sender {
    //启动图片浏览器
    HZPhotoBrowser *browser = [[HZPhotoBrowser alloc] init];
    browser.isFullWidthForLandScape = YES;
    browser.isNeedLandscape = YES;
    browser.sourceImagesContainerView = self; // 原图的父控件
    browser.currentImageIndex = (int)(sender.view.tag - 8000);
    browser.imageCount = self.imageViewArray.count; // 图片总数
    browser.delegate = self;
    [browser show];
}


#pragma mark - photobrowser代理方法
// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(HZPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    FLAnimatedImageView *imageView = (FLAnimatedImageView *)self.subviews[index];
    return imageView.image;
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(HZPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index {
    NSString *urlStr = [self.imageURLs[index] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
    return [NSURL URLWithString:urlStr];
}

/**
 多视图布局

 @param viewArray 视图数组
 @param column 列数
 @param tbSpeace 视图上下间距
 @param lrSpeace 视图左右间距
 @param topSpeace 和父视图上间距
 @param lrSuperViewSpeace 父视图左右间距
 @param superView 父视图
 @param viewHeight 视图高度
 */
- (void)masLayoutSubViewsWithViewArray:(NSArray<UIView *> *)viewArray
                              columnOfRow:(NSInteger)column
                    topBottomOfItemSpeace:(CGFloat)tbSpeace
                      leftRightItemSpeace:(CGFloat)lrSpeace
                     topOfSuperViewSpeace:(CGFloat)topSpeace
                 leftRightSuperViewSpeace:(CGFloat)lrSuperViewSpeace
                          addToSubperView:(UIView *)superView
                               viewHeight:(CGFloat)viewHeight {
  
    CGFloat viewWidth = superView.bounds.size.width;
    CGFloat itemWidth = (viewWidth - lrSuperViewSpeace * 2 - (column - 1) * lrSpeace) / column * 1.0f;
    CGFloat itemHeight = viewHeight;
    UIView *last = nil;
        
    for (int i = 0; i < viewArray.count; i++) {
        UIView *item = viewArray[i];
        [superView addSubview:item];

        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(itemWidth);
            make.height.mas_equalTo(itemHeight);
          
            CGFloat top = topSpeace + (i / column) * (itemHeight + tbSpeace);
            make.top.mas_offset(top);
            if (!last || (i % column) == 0) {
                make.left.mas_offset(lrSuperViewSpeace);
            }else{
                make.left.mas_equalTo(last.mas_right).mas_offset(lrSpeace);
            }
        }];
      
        last = item;
    }
}

@end

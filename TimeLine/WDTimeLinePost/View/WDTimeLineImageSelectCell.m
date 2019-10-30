//
//  WDTimeLineImageSelectCell.m
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineImageSelectCell.h"
#import <Masonry.h>

@interface WDTimeLineImageSelectCell ()<HXPhotoViewDelegate>
@property (nonatomic, strong) HXPhotoView *photoView;
@property (nonatomic, strong) HXPhotoManager *manager;
@end

@implementation WDTimeLineImageSelectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.photoView = [HXPhotoView photoManager:self.manager];
        self.photoView.lineCount = 3;
        self.photoView.delegate = self;
        self.photoView.previewStyle = HXPhotoViewPreViewShowStyleDark;
        [self.photoView goPhotoViewController];
        [self.contentView addSubview:self.photoView];
        
        [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.leading.trailing.mas_equalTo(self.contentView).inset(25);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return self;
}

- (void)photoViewChangeComplete:(HXPhotoView *)photoView allAssetList:(NSArray<PHAsset *> *)allAssetList photoAssets:(NSArray<PHAsset *> *)photoAssets videoAssets:(NSArray<PHAsset *> *)videoAssets original:(BOOL)isOriginal {
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageSelectCell:didChangePhotos:)]) {
        [self.delegate imageSelectCell:self didChangePhotos:photoAssets];
    }
}

#pragma mark - Lazy
- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.configuration.photoMaxNum = 9;
        _manager.configuration.albumShowMode = HXPhotoAlbumShowModePopup;
    }
    return _manager;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

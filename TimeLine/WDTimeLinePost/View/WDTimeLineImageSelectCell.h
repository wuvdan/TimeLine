//
//  WDTimeLineImageSelectCell.h
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HXPhotoView.h>
#import <HXPhotoPicker/NSArray+HXExtension.h>
NS_ASSUME_NONNULL_BEGIN

@class WDTimeLineImageSelectCell;

@protocol WDTimeLineImageSelectCellDelegate <NSObject>

- (void)imageSelectCell:(WDTimeLineImageSelectCell *)cell didChangePhotos:(NSArray<PHAsset *> *)photos;

@end

@interface WDTimeLineImageSelectCell : UITableViewCell
@property (nonatomic, weak) id <WDTimeLineImageSelectCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

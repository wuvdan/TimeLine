//
//  HXPhotoBottomSelectView.m
//  照片选择器
//
//  Created by 洪欣 on 2019/9/30.
//  Copyright © 2019 洪欣. All rights reserved.
//

#import "HXPhotoBottomSelectView.h"
#import "HXPhotoCommon.h"
#import "HXPhotoDefine.h"
#import "UIView+HXExtension.h"
#import "UIFont+HXExtension.h"
#import "NSBundle+HXPhotoPicker.h"

#define Hx_ViewHeight 55.f

@interface HXPhotoBottomSelectView ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *footerCancelView;
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UIView *contentView;
@property (assign, nonatomic) BOOL adaptiveDarkness;
@end

@implementation HXPhotoBottomSelectView

+ (instancetype)showSelectViewWithTitles:(NSArray *)titles cancelTitle:(NSString *)cancelTitle adaptiveDarkness:(BOOL)adaptiveDarkness selectCompletion:(void (^)(NSInteger, NSString * _Nonnull))selectCompletion cancelClick:(void (^)(void))cancelClick {
    HXPhotoBottomSelectView *selectView = [[HXPhotoBottomSelectView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    selectView.adaptiveDarkness = adaptiveDarkness;
    selectView.titles = titles;
    selectView.cancelTitle = cancelTitle;
    selectView.selectCompletion = selectCompletion;
    selectView.cancelClick = cancelClick;
    [[UIApplication sharedApplication].keyWindow addSubview:selectView];
    [selectView showView];
    return selectView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        [self addSubview:self.contentView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChanged:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    }
    return self;
}
- (void)deviceOrientationChanged:(NSNotification *)notify {
    [self didCancelBtnClick:self.cancelBtn];
}
- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    [self changeColor];
    [self recalculateHeight];
}
- (void)setCancelTitle:(NSString *)cancelTitle {
    _cancelTitle = cancelTitle;
    cancelTitle = cancelTitle ?: [NSBundle hx_localizedStringForKey:@"取消"];
    [self.cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
}
- (void)recalculateHeight {
    CGFloat height = self.titles.count * Hx_ViewHeight + self.tableView.tableHeaderView.hx_h + self.tableView.tableFooterView.hx_h;
    if (height > self.hx_h - Hx_ViewHeight * 4) {
        height = self.hx_h - Hx_ViewHeight * 4;
        self.tableView.scrollEnabled = YES;
    }
    self.tableView.hx_h = height;
    self.footerCancelView.hx_y = self.tableView.hx_h + 8.f;
    self.contentView.hx_h = CGRectGetMaxY(self.footerCancelView.frame);
    [self.tableView reloadData];
}
- (void)showView {
    self.bgView.alpha = 0.f;
    self.contentView.hx_y = self.hx_h;
    [UIView animateWithDuration:0.25 animations:^{
        self.bgView.alpha = 1.f;
        self.contentView.hx_y = self.hx_h - self.contentView.hx_h;
    }];
}
- (void)hideView {
    [UIView animateWithDuration:0.2 animations:^{
        self.bgView.alpha = 0.f;
        self.contentView.hx_y = self.hx_h;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.userInteractionEnabled = YES;
        [_bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)]];
    }
    return _bgView;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.hx_w, 0)];
        [_contentView addSubview:self.footerCancelView];
        [_contentView addSubview:self.tableView];
    }
    return _contentView;
}
- (UIView *)footerCancelView {
    if (!_footerCancelView) {
        _footerCancelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.hx_w, 60.f + hxBottomMargin)];
        [_footerCancelView addSubview:self.cancelBtn];
        _footerCancelView.userInteractionEnabled = YES;
        [_footerCancelView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)]];
        self.cancelBtn.frame = CGRectMake(0, 0, self.hx_w, 60.f);
    }
    return _footerCancelView;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelBtn.titleLabel.font = [UIFont hx_helveticaNeueOfSize:17];;
        [_cancelBtn addTarget:self action:@selector(didCancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
- (void)didCancelBtnClick:(UIButton *)button {
    if (self.cancelClick) {
        self.cancelClick();
    }
    [self hideView];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.hx_w, 0) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[HXPhotoBottomSelectViewCell class] forCellReuseIdentifier:@"CellId"];
    }
    return _tableView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HXPhotoBottomSelectViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    cell.adaptiveDarkness = self.adaptiveDarkness;
    cell.title = self.titles[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return Hx_ViewHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectCompletion) {
        self.selectCompletion(indexPath.row, self.titles[indexPath.row]);
    }
    [self hideView];
}
- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

#ifdef __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self changeColor];
        }
    }
#endif
}
- (void)changeColor {
    BOOL isDark = self.adaptiveDarkness ? [HXPhotoCommon photoCommon].isDark : NO;
    self.bgView.backgroundColor = isDark ? [UIColor colorWithRed:0.075 green:0.075 blue:0.075 alpha:0.5f] : [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    self.contentView.backgroundColor = isDark ? [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1] : [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.tableView.backgroundColor = isDark ? [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1] : [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.footerCancelView.backgroundColor = isDark ? [UIColor colorWithRed:0.075 green:0.075 blue:0.075 alpha:1] : [UIColor whiteColor];
    [self.cancelBtn setTitleColor:isDark ? [UIColor whiteColor] : [UIColor colorWithRed:32.f/255.f green:32.f/255.f blue:32.f/255.f alpha:1] forState:UIControlStateNormal];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end


@interface HXPhotoBottomSelectViewCell ()
@property (strong, nonatomic) UILabel *titleLb;
@property (strong, nonatomic) UIView *selectBgView;
@property (strong, nonatomic) UIView *lineView;
@end

@implementation HXPhotoBottomSelectViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView = self.selectBgView;
        [self addSubview:self.titleLb];
        [self addSubview:self.lineView];
    }
    return self;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLb.text = title;
    [self changeColor];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLb.frame = CGRectMake(10, 0, self.hx_w - 20, self.hx_h);
    self.lineView.frame = CGRectMake(0, 0, self.hx_w, 0.5f);
}
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont hx_helveticaNeueOfSize:17];
        _titleLb.numberOfLines = 0;
        _titleLb.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLb;
}
- (UIView *)selectBgView {
    if (!_selectBgView) {
        _selectBgView = [[UIView alloc] init];
    }
    return _selectBgView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
    }
    return _lineView;
}
- (void)changeColor {
    BOOL isDark = self.adaptiveDarkness ? [HXPhotoCommon photoCommon].isDark : NO;
    self.backgroundColor = isDark ? [UIColor colorWithRed:0.075 green:0.075 blue:0.075 alpha:1] : [UIColor whiteColor];
    self.titleLb.textColor = isDark ? [UIColor whiteColor] : [UIColor colorWithRed:32.f/255.f green:32.f/255.f blue:32.f/255.f alpha:1];
    self.selectBgView.backgroundColor = isDark ? [UIColor colorWithRed:0.125 green:0.125 blue:0.125 alpha:1] : [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.lineView.backgroundColor = isDark ? [UIColor colorWithRed:0.125 green:0.125 blue:0.125 alpha:1] : [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
}
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
#ifdef __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            [self changeColor];
        }
    }
#endif
}
@end

//
//  ViewController.m
//  TimeLine
//
//  Created by Unique on 2019/10/28.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "ViewController.h"
#import <JXCategoryView.h>
#import <Masonry.h>
#import "WDTimeLineView.h"

#import "WDTimeLinePostViewController.h"
// 判断是否iPhone X
#define kIS_iPhoneX             (UIApplication.sharedApplication.statusBarFrame.size.height > 20 ? YES : NO)
// 屏幕高度
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
// 状态栏高度
#define kStatusBarHeight        UIApplication.sharedApplication.statusBarFrame.size.height
// 顶部导航栏高度
#define kNavigationBarHeight    44.f
// 状态栏高度 + 顶部导航栏高度
#define kSafeAreaTopHeight      (UIApplication.sharedApplication.statusBarFrame.size.height + 44)
// 底部安全距离
#define kSafeAreaBottomHeight   (kIS_iPhoneX ? 34.f : 0.f)
// Tabbar高度
#define kTabbarHeight           49.f
@interface ViewController () <JXCategoryViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"====[dealloc]");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"社交圈";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(post)];
 
    [self setupCategoryView];
    [self setupScrollView];
    [self setupSubViews];
}

- (void)post {
    WDTimeLinePostViewController *vc = [[WDTimeLinePostViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:true completion:nil];
}

- (void)setupCategoryView {
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight + 44, UIScreen.mainScreen.bounds.size.width, 42)];
    self.categoryView.titleColor = [UIColor lightGrayColor];
    self.categoryView.titleSelectedColor = [UIColor redColor];
    self.categoryView.titleSelectedFont = [UIFont systemFontOfSize:17];
    self.categoryView.titleFont = [UIFont systemFontOfSize:14];
    self.categoryView.titleLabelZoomEnabled = YES;
    self.categoryView.delegate = self;
    self.categoryView.defaultSelectedIndex = 0;
    self.categoryView.titleLabelAnchorPointStyle = JXCategoryTitleLabelAnchorPointStyleBottom;
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = [UIColor whiteColor];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.categoryView.indicators = @[lineView];
    [self.view addSubview:self.categoryView];
    
    self.categoryView.titles = @[@"最新", @"最热", @"推荐", @"古风", @"国漫", @"日漫"];
    self.categoryView.titleColorGradientEnabled = YES;
    [self.view addSubview:self.categoryView];
}

- (void)setupScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width * self.categoryView.titles.count, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.categoryView.contentScrollView = self.scrollView;
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kStatusBarHeight + 42 + 44);
        make.leading.trailing.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    [self.scrollView layoutIfNeeded];
}

- (void)setupSubViews {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.categoryView.titles];
    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        WDTimeLineView *baseView = [[WDTimeLineView alloc] init];
        if (@available(iOS 11.0, *)) {
            baseView.frame = CGRectMake(kScreenWidth * idx, 0, kScreenWidth, CGRectGetHeight(self.scrollView.frame) - kSafeAreaBottomHeight);
        } else {
            baseView.frame = CGRectMake(kScreenWidth * idx, 0, kScreenWidth, CGRectGetHeight(self.scrollView.frame));
        }
        [self.scrollView addSubview:baseView];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}
@end

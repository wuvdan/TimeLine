//
//  WDTimeLinePostViewController.m
//  TimeLine
//
//  Created by Unique on 2019/10/30.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLinePostViewController.h"
#import <Masonry.h>
#import <BRPickerView.h>

#import "WDTimeLinePostTextViewCell.h"
#import "WDTimeLineImageSelectCell.h"
#import "WDTimeLineLocationCell.h"
#import "WDTimeLineTypeSelectCell.h"

@interface WDTimeLinePostViewController ()<UITableViewDelegate, UITableViewDataSource, WDTimeLinePostTextViewCellDelegate, WDTimeLineImageSelectCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat textViewCellHeight;
@property (nonatomic, assign) CGFloat imageCellHeight;

@property (nonatomic, copy) NSString *typeString;
@end

@implementation WDTimeLinePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加圈子";
    self.typeString = @"";
    
    [self.view addSubview:self.tableView];
    self.textViewCellHeight = 130;
    self.imageCellHeight = (UIScreen.mainScreen.bounds.size.width - 25 * 2 - 3 * 2) / 3 + 10 * 2;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        WDTimeLinePostTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDTimeLinePostTextViewCell" forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    } else if (indexPath.row == 1){
        WDTimeLineImageSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDTimeLineImageSelectCell" forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    } else if (indexPath.row == 2) {
        WDTimeLineLocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDTimeLineLocationCell" forIndexPath:indexPath];
        return cell;
    } else {
        WDTimeLineTypeSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDTimeLineTypeSelectCell" forIndexPath:indexPath];
        cell.currentTypeLabel.text = self.typeString.length > 0 ? self.typeString : @"选择分类";
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return self.textViewCellHeight;
    } else if (indexPath.row == 1) {
        return self.imageCellHeight;
    } else if (indexPath.row == 2) {
        return 60;
    } else {
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    
    if (indexPath.row == 3) {
        [BRStringPickerView showStringPickerWithTitle:@"选择分类" dataSource:@[@"古风", @"国漫", @"日漫"] defaultSelValue:nil resultBlock:^(id selectValue) {
            self.typeString = selectValue;
            [self.tableView reloadData];
        }];
    }
}

#pragma mark - WDTimeLinePostTextViewCell Delegate
- (void)postTextViewCell:(WDTimeLinePostTextViewCell *)cell didChangeFrame:(CGRect)frame didChangeText:(NSString *)text {
    self.textViewCellHeight = frame.size.height + 15 * 2;
    [UIView performWithoutAnimation:^{
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }];
}

- (void)postTextViewCell:(WDTimeLinePostTextViewCell *)cell reachedMaxNum:(BOOL)reached {
    if (reached) {
        NSLog(@"=============z最大");
    }
}

#pragma mark - WDTimeLineImageSelectCell Delegate
- (void)imageSelectCell:(WDTimeLineImageSelectCell *)cell didChangePhotos:(NSArray<PHAsset *> *)photos {
    if (photos.count < 3) {
        self.imageCellHeight = (UIScreen.mainScreen.bounds.size.width - 25 * 2 - 3 * 2) / 3 + 10 * 2;
    } else if (photos.count < 6) {
        self.imageCellHeight = (UIScreen.mainScreen.bounds.size.width - 25 * 2 - 3 * 2) / 3 * 2 + 10 * 2 + 3;
    } else {
        self.imageCellHeight = (UIScreen.mainScreen.bounds.size.width - 25 * 2 - 3 * 2) / 3 * 3 + 10 * 2 + 3 * 2;
    }
    
    [UIView performWithoutAnimation:^{
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }];
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [_tableView registerClass:[WDTimeLinePostTextViewCell class] forCellReuseIdentifier:@"WDTimeLinePostTextViewCell"];
        [_tableView registerClass:[WDTimeLineImageSelectCell class] forCellReuseIdentifier:@"WDTimeLineImageSelectCell"];
        [_tableView registerClass:[WDTimeLineLocationCell class] forCellReuseIdentifier:@"WDTimeLineLocationCell"];
        [_tableView registerClass:[WDTimeLineTypeSelectCell class] forCellReuseIdentifier:@"WDTimeLineTypeSelectCell"];
    }
    return _tableView;
}
@end

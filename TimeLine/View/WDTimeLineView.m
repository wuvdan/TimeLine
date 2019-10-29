//
//  WDTimeLineView.m
//  TimeLine
//
//  Created by Unique on 2019/10/29.
//  Copyright © 2019 Unique. All rights reserved.
//

#import "WDTimeLineView.h"

#import <UIImageView+WebCache.h>
#import <Masonry.h>

#import "WDTimeLineConstant.h"
#import "WDTimeLineTool.h"

#import "WDTimeLinePureTextTableViewCell.h"
#import "WDTimeLinePureImageTableViewCell.h"
#import "WDTimeLineTableViewCell.h"

@interface WDTimeLineView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<NSString *> *array1;
@property (nonatomic, copy) NSArray<NSString *> *array2;
@property (nonatomic, copy) NSArray<NSString *> *array3;
@property (nonatomic, copy) NSArray<NSString *> *array4;
@property (nonatomic, copy) NSArray<NSString *> *array5;
@property (nonatomic, copy) NSArray<NSString *> *array6;
@property (nonatomic, copy) NSArray<NSString *> *array7;
@property (nonatomic, copy) NSArray<NSString *> *array8;
@property (nonatomic, copy) NSArray<NSString *> *array9;
@property (nonatomic, copy) NSArray<NSString *> *array10;
@end

@implementation WDTimeLineView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
        
        self.array1 = @[@"http://img0.imgtn.bdimg.com/it/u=1782247009,1941089753&fm=26&gp=0.jpg"];
        
        self.array2 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=8dd36018640a01f59d143e41d34580c5&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D7427db0c8fb1cb133e693c1bed5556da%2Fd100baa1cd11728b079f3cc1cafcc3cec2fd2ca6.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=a9bf5de946e91b572e973202926d9586&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb24f98b95e63cf85b7b844abd6c35c727087460751dc4-EoH6zE_fw658"];
        
        self.array3 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=bb0bdc6df6180414920b4ff4a1ff12ba&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201409%2F08%2F20140908130358_xUHYS.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=2dbc1227fcc9924031b9b85d03f11863&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Ffc6735d3816265a9a361b35124342b1b0e01b4d71098d-bV8lLO_fw658", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=714ed4e46cf1a9cd4466228f47f681d9&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201708%2F18%2F20170818145653_R2kYK.jpeg"];
        
        self.array4 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=e5e35ccb06166f922799da2a42be0f91&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201807%2F23%2F20180723170247_gkyal.thumb.700_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=1f94c0f6833d9227cf1e0ab1cb41a306&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F8c938b5d5799fe2b197fe0acaf1fe3e37c24e6b819375-KGfown_fw658", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=8ae44c2836e40d072d8b094d6ee5efb0&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201712%2F09%2F20171209092045_jhUkE.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839069&di=64c081044d94b2918a0c3f93fb293e9a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Faeb9c6eb866cd7aadd908d05e01e98b97ffc639316f0e-1RMbJr_fw658"];
        
        self.array5 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839068&di=d41658de5b708ffb961af574294bcb45&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F05%2F20150305003224_2CQnL.thumb.700_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839068&di=4eb1b47aa5f304a80a843faa31eeb52e&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fcfed0c13892e2f5b4796e0f01d41c41de0ba94315dbb0-WT5mvl_fw658", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839068&di=60e8565d6b9765af86d94e91070f0e2a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201704%2F16%2F20170416233348_UuQjt.thumb.700_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839068&di=e44e277da99ff3970535c51132385115&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201604%2F08%2F20160408180951_EChrW.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=d3fb0867fafccad8899e21b917ee9bc4&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201410%2F11%2F20141011105438_XfjZ3.jpeg"];
        self.array6 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=4278dbddecfeafb933a234f2054e15f6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201504%2F04%2F20150404H4253_J4BQL.thumb.224_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=ae8aa1e5a32a317279fa6828ea756d18&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201603%2F05%2F20160305211047_MS3dX.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=17d2d34dc3093c1c58c6a66704733ee5&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201509%2F29%2F20150929154608_fRvJm.thumb.700_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=90ad4e210fa2c7f6e2a0c7acc33d4283&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201701%2F27%2F20170127192733_cFGYn.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572326325520&di=cf1f4a8fcc2527ba8ba68884f6f32474&imgtype=jpg&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D3428944624%2C632371858%26fm%3D214%26gp%3D0.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=333c93d76b85dfd976b940d0ab228071&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201806%2F17%2F20180617184259_ycLdG.jpeg"];
        self.array7 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=1e4ecc9080fed6529074b792cfd8855b&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F160534f81a50a4764c7a0d1aa66ae44318e9ae1219206-ITX2LR_fw658", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839270&di=fc0302c37301a85e5973eb5e548b3441&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F61d263bb908df60464df018d36041730723949a9.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=d224d40d2fbc1796ca8159f1480013b8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201703%2F19%2F20170319215124_BKEhR.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=9ac9d887443f4687d00b3f15ab4b69cf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201706%2F06%2F20170606115624_hyfic.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=86aa48e31f9471dd9f26b3e0440fb1a3&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F759014b2de078538870014c2d055a683e7882f4e5ff1c-fwNzLH_fw658", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=b6708f8743f321f0d4bbd2ae3cb1fab3&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201609%2F30%2F20160930214049_BXekF.png", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=277cef55a5f7df5a744a8f666b5eeee0&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F17%2F20180317151739_V2cil.jpeg"];
        self.array8 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=ea46283fd6f57d75252673c2df991e2f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201409%2F22%2F20140922024521_XdZ2F.png", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=f048a56087ba6b485751114816e4fcd9&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb7fe0565d2cb2a1ca431f81d8b8b4260d73a8fa0215d7-UXMrbr_fw658", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=e7eb0392d53b54d7d1878368f8467e28&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201606%2F27%2F20160627105008_Jiajn.thumb.224_0.png", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=428f0b564c976fb89d035611851abf91&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201508%2F11%2F20150811153724_rLiZn.thumb.224_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839269&di=1494d66531696282bc68a1fa793649f5&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F15%2F20150315205034_EmzLs.thumb.700_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=7f66c820f710b8be7a87a84a06b1b8a9&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F11%2F20161211115938_2cQhf.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=13c3a1f2550a45e52367357e7bcead6d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201702%2F09%2F20170209170542_htVKf.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=9d7aef7fb2a4549e0142b80fa42e0a9c&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F4ae2fb19ae12562c01f1474220889bad68b12ab397e710-u9eliJ_fw236"];
        self.array9 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=66d8014675214182803a4ba1e4c9c741&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201205%2F02%2F20120502182421_nBFmT.thumb.700_0.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=75ea6779c0de6c527a8124688ae5b24f&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201308%2F13%2F20130813141311_PFWXQ.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=c843fdea1ad37a7463385372d0883546&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201512%2F08%2F20151208145022_E3iWL.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572326535239&di=002c62699e6edb3f36f24e55c93332a8&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2944327880%2C1528117397%26fm%3D214%26gp%3D0.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572324839268&di=8ebcc5b650eff286f38461acd4127a45&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F7146a322383a36b01f34b3389c516a3899b357cf1625f-WYUpj8_fw236", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572326420195&di=f462fbf5af1274e680731b5490f66555&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0127255be29258a80121ab5d47f7cd.jpg%401280w_1l_2o_100sh.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572326420195&di=b8ff71a97e23b160e898ac98f9af587b&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201312%2F04%2F20131204101035_Ncajf.thumb.700_0.png", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572326420195&di=3e3433e65b02434f6731cf71011fce95&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201701%2F08%2F20170108102644_mLWzu.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572326420195&di=88b415997a378d7363c9d14679294a7b&imgtype=0&src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20181223%2F18%2F1545560229-XYHDshAzZM.jpg"];
        
        self.array10 = @[@"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
                         @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
                         @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
                         @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
                         @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
                         @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。", @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
                         @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。",
        @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。"];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    else return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        NSString *idString = [NSString stringWithFormat:@"IdText-%ld-%ld", (long)indexPath.row, (long)indexPath.section];
        WDTimeLinePureTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
        if (cell == nil) {
            cell = [[WDTimeLinePureTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
        }
        [cell.userHeaderImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572264400778&di=b00fcdff20ac4c771fdf62de52d22276&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201701%2F18%2F20170118111741_cFZNA.jpeg"]];
        cell.userNickNameLabel.text = @"古风爱好者001";
        cell.articleInfoLabel.text = @"1W阅读    998点赞    765评论    1小时前";
        cell.contentTextLabel.text = @"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。";
        return cell;
    } else if (indexPath.section == 1) {
        NSString *idString = [NSString stringWithFormat:@"IdImage-%ld-%ld", (long)indexPath.row, (long)indexPath.section];
        WDTimeLinePureImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
        if (cell == nil) {
            cell = [[WDTimeLinePureImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
        }

        cell.userNickNameLabel.text = @"古风爱好者002";
        cell.articleInfoLabel.text = @"1K阅读    68点赞    10评论    1天前";
        
        if (indexPath.row == 0) {
            cell.imagesArray = self.array1;
        } else if (indexPath.row == 1) {
            cell.imagesArray = self.array2;
        } else if (indexPath.row == 2) {
            cell.imagesArray = self.array3;
        } else if (indexPath.row == 3) {
            cell.imagesArray = self.array4;
        } else if (indexPath.row == 4) {
            cell.imagesArray = self.array5;
        } else if (indexPath.row == 5) {
            cell.imagesArray = self.array6;
        } else if (indexPath.row == 6) {
            cell.imagesArray = self.array7;
        } else if (indexPath.row == 7) {
            cell.imagesArray = self.array8;
        } else if (indexPath.row == 8) {
            cell.imagesArray = self.array9;
        }
        [cell.userHeaderImageView sd_setImageWithURL:[NSURL URLWithString:cell.imagesArray.firstObject]];
        return cell;
    } else {
        NSString *idString = [NSString stringWithFormat:@"IdImage-%ld-%ld", (long)indexPath.row, (long)indexPath.section];
        WDTimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idString];
        if (cell == nil) {
            cell = [[WDTimeLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
        }

        cell.userNickNameLabel.text = @"古风爱好者0023";
        cell.articleInfoLabel.text = @"9k阅读    676点赞    987评论    1月前";
        
        if (indexPath.row == 0) {
            cell.imagesArray = self.array1;
            cell.contentTextLabel.text = @"";
        } else if (indexPath.row == 1) {
            cell.imagesArray = self.array2;
        } else if (indexPath.row == 2) {
            cell.imagesArray = self.array3;
        } else if (indexPath.row == 3) {
            cell.imagesArray = self.array4;
        } else if (indexPath.row == 4) {
            cell.imagesArray = self.array5;
        } else if (indexPath.row == 5) {
            cell.imagesArray = self.array6;
        } else if (indexPath.row == 6) {
            cell.imagesArray = self.array7;
        } else if (indexPath.row == 7) {
            cell.imagesArray = self.array8;
        } else if (indexPath.row == 8) {
            cell.imagesArray = self.array9;
        }
        cell.contentTextLabel.text = self.array10[indexPath.row];
        [cell.userHeaderImageView sd_setImageWithURL:[NSURL URLWithString:cell.imagesArray.firstObject]];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [WDTimeLineTool pureTextHeightOfText:@"最近刚参加了国漫展会，很开心。和大家分享一下这次拍的照片吧。"];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@""]];
        } else if (indexPath.row == 1) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @""]];
        } else if (indexPath.row == 2) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @""]];
        } else if (indexPath.row == 3) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @"", @""]];
        } else if (indexPath.row == 4) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @"", @"", @""]];
        } else if (indexPath.row == 5) {
           return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @"", @"", @"", @""]];
        } else if (indexPath.row == 6) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @"", @"", @"", @"", @""]];
        } else if (indexPath.row == 7) {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @"", @"", @"", @"", @"", @""]];
        } else {
            return [WDTimeLineTool pureImageHeightOfImages:@[@"", @"", @"", @"", @"", @"", @"", @"", @""]];
        }
    } else {
               
        if (indexPath.row == 0) {
            return [WDTimeLineTool normalHeightWithImages:@[@""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 1) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 2) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 3) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @"", @""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 4) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @"", @"", @""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 5) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @"", @"", @"", @""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 6) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @"", @"", @"", @"", @""] text:self.array10[indexPath.row]];
        } else if (indexPath.row == 7) {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @"", @"", @"", @"", @"", @""] text:self.array10[indexPath.row]];
        } else {
            return [WDTimeLineTool normalHeightWithImages:@[@"", @"", @"", @"", @"", @"", @"", @"", @""] text:self.array10[indexPath.row]];
        }
    }
}


#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end

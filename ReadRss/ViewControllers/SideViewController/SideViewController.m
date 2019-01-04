//
//  SideViewController.m
//  ReadRss
//
//  Created by cheng on 2018/11/15.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "SideViewController.h"
#import <Masonry/Masonry.h>
#import "SideTableViewCell.h"
#import "DataManager.h"
#import "JKCategories.h"
#import "RDRouter.h"

@interface SideViewController ()
@property(strong, nonatomic) UIView *maskView;
@property(strong, nonatomic) UIView *contentView;
@property(strong, nonatomic) UIView *navbarView;
@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray<NSDictionary *> *navArr;

@end

@implementation SideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navArr = @[
                    @{@"type":@(SideNavType_Home),@"content":@[]},
                    @{@"type":@(SideNavType_Like),@"content":@[]},
                    @{@"type":@(SideNavType_List), @"content":[DataManager sharedInstance].rssList},
                    ];
    [self createUI];
}

- (void) createUI {
    [self.view addSubview:self.maskView];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(self.view);
    }];
    
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.view.mas_height);
        make.width.mas_equalTo(@(ScreenWidth*3/4));
        make.left.equalTo(self.view.mas_left);
    }];
    
    [self.contentView addSubview:self.navbarView];
    [self.navbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.width.equalTo(self.contentView.mas_width);
        make.height.mas_equalTo(kIphoneStatusAndNavigationHeight);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(kIphoneStatusBarHeight);
        make.width.equalTo(self.contentView.mas_width);
        make.height.mas_equalTo(kIphoneNavigationBarHeight);
        make.left.equalTo(self.contentView.mas_left);
    }];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(kIphoneStatusAndNavigationHeight);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
    }];
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.contentView.frame = CGRectMake(-3*ScreenWidth/4, 0, 3*ScreenWidth/4, ScreenHeight);
    self.maskView.alpha = 0;
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.frame = CGRectMake(0, 0, 3*ScreenWidth/4, ScreenHeight);
        self.maskView.alpha = 0.75f;
    } completion:^(BOOL finished) {

    }];
}

- (UIView *) maskView {
    if(!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.view.frame];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.5;
        UITapGestureRecognizer *maskTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClose)];
        [_maskView addGestureRecognizer:maskTap];
    }
    return _maskView;
}

- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*3/4, ScreenHeight)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (UIView *)navbarView {
    if(!_navbarView) {
        _navbarView = [[UIView alloc] init];
        _navbarView.backgroundColor = [UIColor whiteColor];
//        _navbarView.layer.borderColor = RGBACOLOR(198, 198, 198, 1.0).CGColor;
//        _navbarView.layer.borderWidth = 0.5;
        _navbarView.userInteractionEnabled = YES;
    }
    return _navbarView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = AppName;
        _titleLabel.textColor = RGBACOLOR(51, 51, 51, 1.0);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLabel;
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.estimatedRowHeight = 50;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void) onClose {
    [self close];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SideTableViewCell"];
    if(cell == nil) {
        cell = [[SideTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SideTableViewCell"];
    }
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    RssInfoModel *model = (RssInfoModel *) self.navArr[section][@"content"][row];
    [cell refreshUI: model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    RssInfoModel *model = (RssInfoModel *) self.navArr[section][@"content"][row];
    [RDRouter openURL:ROUTER_ARTICLE_LIST withUserInfo:@{@"rssInfoModel": model} completion:nil];
    [self close];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return NavConfig.count;
    return [((NSArray *)self.navArr[section][@"content"]) count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.navArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 52*kScale;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3*ScreenWidth/4 , 52*kScale)];
    headerView.userInteractionEnabled = YES;
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = RGBACOLOR(51, 51, 51, 1.0);
    label.font = GLOBAL_FONT_SIZE(20*kScale);
    label.frame = CGRectMake(32*kScale, 16*kScale, 100, 22*kScale);
    
    NSInteger type = [self.navArr[section][@"type"] integerValue];
    if(type == SideNavType_Home) {
        label.text = @"主页";
    } else if (type == SideNavType_Like) {
        label.text = @"收藏";
    } else {
        label.text = @"订阅列表";
    }
    [headerView addSubview:label];
    WEAK_SELF
    [headerView jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        if(type == SideNavType_Home) {
            [RDRouter openURL:ROUTER_HOME];
        } else if (type == SideNavType_Like) {
            [RDRouter openURL:ROUTER_LIKE];
        }
        [weakSelf close];
    }];
    return headerView;
}

- (void) close {
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.frame = CGRectMake(-3*ScreenWidth/4, 0, 3*ScreenWidth/4, ScreenHeight);
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    
}

@end

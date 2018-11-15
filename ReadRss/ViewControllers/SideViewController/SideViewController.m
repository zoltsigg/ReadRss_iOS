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

#define NavConfig @[@{@"title":@"首页", @"icon": @"sidebar_home_50x50_"}, @{@"title":@"收藏",@"icon":@"sidebar_liked_50x50_"}, @{@"title":@"设置",@"icon":@"sidebar_liked_50x50_"}]

@interface SideViewController ()

@end

@implementation SideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
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
        _navbarView.layer.borderColor = RGBACOLOR(198, 198, 198, 1.0).CGColor;
        _navbarView.layer.borderWidth = 0.5;
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
    }
    return _tableView;
}

- (void) onClose {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNo = indexPath.row;
    SideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SideTableViewCell"];
    if(cell == nil) {
        cell = [[SideTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SideTableViewCell"];
    }
    [cell refreshUI:NavConfig[rowNo]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index:%ld", [indexPath row]);
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NavConfig.count;
//    return 0;
}

@end

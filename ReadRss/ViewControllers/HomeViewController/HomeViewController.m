//
//  HomeViewController.m
//  ReadRss
//
//  Created by cheng on 2018/10/19.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry/Masonry.h>
#import "NetworkClient.h"
#import "AddLinkViewController.h"
#import "LoginInfoModel.h"
#import "SimpleKeychain.h"
#import "RssInfoTableCell.h"
#import "ArticleViewController.h"
#import "DataManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBar];
    self.rssList = [[NSArray alloc] init];
    [self createUI];
    [self requestData];
    [self addNotification];
}

- (void) dealloc {
    [self removeNotification];
}

- (void) addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUI) name:kNotificationAddRss object:nil];
}

- (void) removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) setTitleBar {
    [self setRightBtnIcon:[UIImage imageNamed:@"ic_navbar_setting"]];
    [self setLeftBtnIcon:[UIImage imageNamed:@"hamburger"]];
    [self setTitle:@"首页"];
    
}

- (void) onLeftClick {
    NSLog(@"onLeftClick");
//    AddLinkViewController *vc = [[AddLinkViewController alloc] init];
//    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
//    [self presentViewController:vc animated:YES completion:nil];
    
    [self openLeftSide];
}

- (void) onRightClick {
    NSLog(@"onRightClick");
}

- (void) requestData {
    
    [self.view makeToastActivity:CSToastPositionCenter];
    [[NetworkClient sharedInstance] login:^(BOOL success, LoginInfoModel *model) {
        [self.view hideToastActivity];
        if(success) {
            [[A0SimpleKeychain keychain] setString:model.token forKey:@"token"];
            self.rssList = model.list;
            [[DataManager sharedInstance] setRssList:model.list];
            [self.tableView reloadData];
        } else {
            
        }
    }];
}

- (void) createUI {
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(self.contentView);
    }];
}


- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.contentView.frame];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.estimatedRowHeight = 50;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger rowNo = indexPath.row;
    RssInfoModel *model = self.rssList[rowNo];
    RssInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RssInfoTableCell"];
    if(cell == nil) {
        cell = [[RssInfoTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"RssInfoTableCell"];
    }
    [cell refreshUI: model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index:%ld", [indexPath row]);

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ArticleViewController *vc = [[ArticleViewController alloc] init];
    vc.rid = [[self.rssList objectAtIndex:[indexPath row]].rid integerValue];
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rssList.count;
}


- (void) refreshUI {
    self.rssList  = [DataManager sharedInstance].rssList;
    [self.tableView reloadData];
}

@end

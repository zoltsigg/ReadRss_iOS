//
//  PSViewController.m
//  ReadRss
//
//  Created by cheng on 2018/11/16.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "PSViewController.h"
#import "SettingViewController.h"
#import "HomeViewController.h"
#import "ArticleViewController.h"
#import "RDRouter.h"
#import "DetailViewController.h"
#import "ArticleModel.h"

@interface PSViewController ()

@end

@implementation PSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self addNotification];
    [self registerRouter];
}

- (void)dealloc {
    [self removeNotification];
}
- (void) addNotification {

}

- (void) removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) createUI {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildViewController:homeVC];
    
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    [self addChildViewController:settingVC];
    
    ArticleViewController *articleVC = [[ArticleViewController alloc] init];
    [self addChildViewController:articleVC];
    
}


- (void) registerRouter {
    WEAK_SELF
    [RDRouter registerURLPattern:ROUTER_HOME toHandler:^(NSDictionary *routerParameters) {
        [weakSelf setSelectedIndex:0];
    }];
    
    [RDRouter registerURLPattern:ROUTER_LIKE toHandler:^(NSDictionary *routerParameters) {
        [weakSelf setSelectedIndex:0];
    }];
    
    [RDRouter registerURLPattern:ROUTER_ARTICLE_LIST toHandler:^(NSDictionary *routerParameters) {
//        NSInteger rid = [routerParameters[RouterParameterUserInfo][@"rid"] integerValue];
        RssInfoModel *model = (RssInfoModel *)routerParameters[RouterParameterUserInfo][@"rssInfoModel"];
        [weakSelf setSelectedIndex:2];
        ArticleViewController *vc = (ArticleViewController *) weakSelf.selectedViewController;
    
        [vc showData:model];
    }];
    
    [RDRouter registerURLPattern:ROUTER_ARTICLE_DETAIL toHandler:^(NSDictionary *routerParameters) {
        UIViewController *fromVC = routerParameters[RouterParameterUserInfo][@"fromVC"];
        ArticleModel *model = (ArticleModel *) routerParameters[RouterParameterUserInfo][@"articleModel"];
        
        DetailViewController *vc = [[DetailViewController alloc] init];
        vc.article = model;
        [fromVC presentViewController:vc animated:YES completion:nil];
    }];
}

@end

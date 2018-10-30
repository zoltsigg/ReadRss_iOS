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

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBar];
    [self createUI];
}

- (void) setTitleBar {
    [self setRightBtnIcon:[UIImage imageNamed:@"ic_setting"]];
    [self setLeftBtnIcon:[UIImage imageNamed:@"ic_add"]];
    
}

- (void) onLeftClick {
    NSLog(@"onLeftClick");
    AddLinkViewController *vc = [[AddLinkViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) onRightClick {
    NSLog(@"onRightClick");
}

- (void) createUI {
    
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.estimatedRowHeight = 50;
    }
    return _tableView;
}

- (void) onClick {
    NSLog(@"Click");
    [[NetworkClient sharedInstance] login];
}

@end

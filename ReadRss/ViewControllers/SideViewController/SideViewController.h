//
//  SideViewController.h
//  ReadRss
//
//  Created by cheng on 2018/11/15.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakerNavbarViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SideViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UIView *maskView;
@property(strong, nonatomic) UIView *contentView;
@property(strong, nonatomic) UIView *navbarView;
@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END

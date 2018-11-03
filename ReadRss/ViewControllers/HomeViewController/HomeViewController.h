//
//  HomeViewController.h
//  ReadRss
//
//  Created by cheng on 2018/10/19.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakerNavbarViewController.h"
#import "RssInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : FakerNavbarViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray<RssInfoModel *> *rssList;

@end

NS_ASSUME_NONNULL_END

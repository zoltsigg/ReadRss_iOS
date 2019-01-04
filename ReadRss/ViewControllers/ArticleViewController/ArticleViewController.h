//
//  ArticleViewController.h
//  ReadRss
//
//  Created by cheng on 2018/11/2.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakerNavbarViewController.h"
#import "ArticleModel.h"
#import "RssInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ArticleViewController :FakerNavbarViewController <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *articleTableView;
@property(strong, nonatomic) NSArray<ArticleModel *> *articleList;
@property(assign, nonatomic) RssInfoModel *model;

-(void) showData:(RssInfoModel *) model;
@end

NS_ASSUME_NONNULL_END

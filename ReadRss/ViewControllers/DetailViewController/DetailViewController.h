//
//  DetailViewController.h
//  ReadRss
//
//  Created by cheng on 2018/11/18.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "FakerNavbarViewController.h"
#import "ArticleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : FakerNavbarViewController

@property(strong, nonatomic) ArticleModel *article;
@property(nonatomic, strong) UIWebView *webView;

@end

NS_ASSUME_NONNULL_END

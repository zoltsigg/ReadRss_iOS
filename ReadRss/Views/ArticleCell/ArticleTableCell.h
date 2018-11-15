//
//  ArticleTableCell.h
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ArticleTableCell : UITableViewCell

@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UILabel *timeLabel;

- (void) refreshUI: (ArticleModel *) model;

@end

NS_ASSUME_NONNULL_END

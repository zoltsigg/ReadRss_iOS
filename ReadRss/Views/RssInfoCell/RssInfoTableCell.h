//
//  RssInfoTableCell.h
//  ReadRss
//
//  Created by cheng on 2018/11/2.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssInfoTableCell : UITableViewCell

@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UILabel *descLabel;
@property(strong, nonatomic) UIView *badgeView;
@property(strong, nonatomic) UILabel *badgeLabel;

- (void) refreshUI: (RssInfoModel *) model;

@end

NS_ASSUME_NONNULL_END

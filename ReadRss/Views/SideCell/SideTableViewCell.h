//
//  SideTableViewCell.h
//  ReadRss
//
//  Created by cheng on 2018/11/15.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SideTableViewCell : UITableViewCell


@property(strong, nonatomic) UIImageView *icon;
@property(strong, nonatomic) UILabel *navLabel;

- (void) refreshUI: (RssInfoModel *) model;
@end

NS_ASSUME_NONNULL_END

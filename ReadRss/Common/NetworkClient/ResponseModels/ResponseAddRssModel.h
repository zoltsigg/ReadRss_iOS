//
//  ResponseAddRssModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/1.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"
#import "RssInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ResponseAddRssModel : NetworkModel

@property(strong, nonatomic) RssInfoModel *data;

@end

NS_ASSUME_NONNULL_END

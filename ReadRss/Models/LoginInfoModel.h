//
//  LoginInfoModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/1.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginInfoModel : NSObject

@property(strong, nonatomic) NSString *token;
@property(strong, nonatomic) NSArray<RssInfoModel *> *list;

@end

NS_ASSUME_NONNULL_END

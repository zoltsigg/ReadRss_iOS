//
//  ResponseLoginModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/1.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"
#import "LoginInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ResponseLoginModel : NetworkModel

@property(strong, nonatomic) LoginInfoModel *data;
@end

NS_ASSUME_NONNULL_END

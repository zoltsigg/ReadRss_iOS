//
//  LoginInfoModel.m
//  ReadRss
//
//  Created by cheng on 2018/11/1.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "LoginInfoModel.h"

@implementation LoginInfoModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list" : [RssInfoModel class]};
}
@end

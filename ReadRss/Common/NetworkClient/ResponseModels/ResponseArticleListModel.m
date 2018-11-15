//
//  ResponseArticleModel.m
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "ResponseArticleListModel.h"

@implementation ResponseArticleListModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : [ArticleModel class]};
}

@end

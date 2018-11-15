//
//  ResponseArticleModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"
#import "ArticleModel.h"

@interface ResponseArticleListModel : NetworkModel

@property(strong, nonatomic) NSArray<ArticleModel *> *data;

@end



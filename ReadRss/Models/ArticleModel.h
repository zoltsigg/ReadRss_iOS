//
//  ArticleModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/6.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleModel : NSObject
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *summary;
@property(strong, nonatomic) NSString *content;
@property(strong, nonatomic) NSString *link;
@property(strong, nonatomic) NSNumber *publishDate;

@end

NS_ASSUME_NONNULL_END

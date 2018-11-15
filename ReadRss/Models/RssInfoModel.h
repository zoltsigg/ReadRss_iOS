//
//  AddRssModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/1.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RssInfoModel : NSObject

@property(copy, nonatomic) NSNumber *rid;
@property(copy, nonatomic) NSString *desc;
@property(copy, nonatomic) NSString *link;
@property(copy, nonatomic) NSString *title;

@end

NS_ASSUME_NONNULL_END

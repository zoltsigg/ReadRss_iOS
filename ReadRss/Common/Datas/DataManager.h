//
//  DataManager.h
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RssInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject
@property(strong, nonatomic) NSArray<RssInfoModel *> *rssList;


+ (instancetype) sharedInstance;
- (void) initDB;
@end

NS_ASSUME_NONNULL_END

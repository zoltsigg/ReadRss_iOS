//
//  ArticlesTbl.h
//  ReadRss
//
//  Created by cheng on 2018/11/30.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticlesTbl : NSObject

@property int localID;
@property(retain) NSString *link;
@property int status;

@end

NS_ASSUME_NONNULL_END

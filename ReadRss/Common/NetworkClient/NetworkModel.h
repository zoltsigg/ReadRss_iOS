//
//  NetworkModel.h
//  ReadRss
//
//  Created by cheng on 2018/11/1.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkModel : NSObject

@property(assign, nonatomic) NSInteger code;
@property(strong, nonatomic) NSString *msg;

@end

NS_ASSUME_NONNULL_END

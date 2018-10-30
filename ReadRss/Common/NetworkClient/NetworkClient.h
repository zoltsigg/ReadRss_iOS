//
//  NetworkClient.h
//  ReadRss
//
//  Created by cheng on 2018/10/19.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkClient : NSObject

@property(strong, nonatomic) AFHTTPSessionManager *manager;

+ (instancetype) sharedInstance;
- (void) login;
@end

NS_ASSUME_NONNULL_END

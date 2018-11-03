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
typedef void (^NetworkCallback)(BOOL isSuccess, id _Nullable data);

@interface NetworkClient : NSObject

@property(strong, nonatomic) AFHTTPSessionManager *manager;
@property(strong, nonatomic) NSString *token;

+ (instancetype) sharedInstance;
- (void) login:(NetworkCallback)callback;
- (void) addRss: (NSString *) url callback: (NetworkCallback) callback;
@end

NS_ASSUME_NONNULL_END

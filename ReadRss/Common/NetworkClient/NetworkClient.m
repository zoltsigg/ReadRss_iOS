//
//  NetworkClient.m
//  ReadRss
//
//  Created by cheng on 2018/10/19.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "NetworkClient.h"

@implementation NetworkClient

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static NetworkClient *_shareInstance = nil;
    dispatch_once(&onceToken, ^{
        if(!_shareInstance) {
            _shareInstance = [[NetworkClient alloc] init];
        }
    });
    return _shareInstance;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        self.manager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void) login {
    NSString *url = @"http://192.168.10.113:8888/index/";
    NSDictionary *param = @{
                            @"s": @"home.Login",
                            @"param": @"{\"token\":\"\"}"
                            };
    
    [self.manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    
}

@end

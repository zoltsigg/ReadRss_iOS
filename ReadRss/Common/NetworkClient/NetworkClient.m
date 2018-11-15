//
//  NetworkClient.m
//  ReadRss
//
//  Created by cheng on 2018/10/19.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "NetworkClient.h"
#import "YYModel.h"
#import "ResponseModels/ResponseAddRssModel.h"
#import "ResponseModels/ResponseLoginModel.h"
#import "SimpleKeychain.h"
#import "ResponseModels/ResponseArticleListModel.h"

@implementation NetworkClient

#define URL @"http://127.0.0.1:8888/index/"

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

- (NSString *) getToken {
    if(self.token && self.token.length > 0) {
        return self.token;
    }
    
    self.token = [[A0SimpleKeychain keychain] stringForKey:@"token"];
    if(self.token && self.token.length > 0) {
        return self.token;
    }
    return @"";
}

- (void) login:(NetworkCallback) callback {
    NSString *token = [self getToken];
    NSDictionary *param = @{
                            @"s": @"home.Login",
                            @"param": [ToolUtils dict2json:@{@"token": token}]
                            };
    
    [self.manager POST:URL parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        ResponseLoginModel *model = [ResponseLoginModel yy_modelWithJSON:responseObject];
        if(model.code == 200) {
            callback(YES, model.data);
        } else {
            callback(NO, nil);
        }
      
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
        callback(NO, nil);
    }];
    
}

- (void) addRss: (NSString *) url callback: (NetworkCallback) callback{
    NSDictionary *param = @{
                            @"s" : @"home.AddRss",
                            @"param": [ToolUtils dict2json:@{@"link": url, @"token":[self getToken]}]
                            };
    [self.manager POST:URL parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject: %@", responseObject);
        ResponseAddRssModel *model = [ResponseAddRssModel yy_modelWithJSON:responseObject];
        if(model.code == 200) {
            callback(YES, model.data);
        } else {
            callback(NO, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
        callback(NO, nil);
    }];
}

- (void) getArticleList: (NSInteger) rid callback: (NetworkCallback) callback {
    NSDictionary *param = @{
                            @"s" : @"home.GetArticleList",
                            @"param": [ToolUtils dict2json:@{@"rid": [NSNumber numberWithInteger:rid]}]
                            };
    [self.manager POST:URL parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        ResponseArticleListModel *model = [ResponseArticleListModel yy_modelWithJSON:responseObject];
        if(model.code == 200) {
            callback(YES, model.data);
        } else {
            callback(NO, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(NO, nil);
    }];
}
@end

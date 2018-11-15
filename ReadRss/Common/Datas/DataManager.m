//
//  DataManager.m
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static DataManager *_sharedInstacne = nil;
    dispatch_once(&onceToken, ^{
        if(!_sharedInstacne) {
            _sharedInstacne = [[DataManager alloc] init];
        }
    });
    return _sharedInstacne;
}

@end

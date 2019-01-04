//
//  DataManager.m
//  ReadRss
//
//  Created by cheng on 2018/11/12.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "DataManager.h"
#import "ArticlesTbl.h"
#import <WCDB/WCDB.h>

@interface DataManager()
@property(strong, nonatomic) WCTDatabase *database;

@end

@implementation DataManager

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static DataManager *_sharedInstacne = nil;
    dispatch_once(&onceToken, ^{
        if(!_sharedInstacne) {
            _sharedInstacne = [[DataManager alloc] init];
            [_sharedInstacne defaultInit];
        }
    });
    return _sharedInstacne;
}

- (void) defaultInit {
    self.rssList = @[];
}

- (void) initDB {
    BOOL result = [_database createTableAndIndexesOfName:@"ArticlesTbl" withClass:ArticlesTbl.class];
    NSLog(@"initDB: %i", result);
}

- (WCTDatabase *) database {
    if(!_database) {
        NSString *docuPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [docuPath stringByAppendingPathComponent:@"Read.db"];
        _database = [[WCTDatabase alloc] initWithPath:path];
    }
    return _database;
}



@end

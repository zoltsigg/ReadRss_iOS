//
//  ArticlesTbl.m
//  ReadRss
//
//  Created by cheng on 2018/11/30.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "ArticlesTbl.h"
#import <WCDB/WCDB.h>
#import "ArticlesTbl+WCTTableCoding.h"
@implementation ArticlesTbl

WCDB_IMPLEMENTATION(ArticlesTbl)
WCDB_SYNTHESIZE(ArticlesTbl, localID)
WCDB_SYNTHESIZE(ArticlesTbl, link)
WCDB_SYNTHESIZE(ArticlesTbl, status)

//WCDB_PRIMARY(ArticlesTbl, localID)
WCDB_PRIMARY_AUTO_INCREMENT(ArticlesTbl, localID)


@end

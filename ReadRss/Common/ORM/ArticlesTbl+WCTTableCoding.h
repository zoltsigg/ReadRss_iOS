//
//  ArticlesTbl+WCTTableCoding.h
//  ReadRss
//
//  Created by cheng on 2018/12/4.
//  Copyright © 2018 cheng. All rights reserved.
//

#ifndef ArticlesTbl_WCTTableCoding_h
#define ArticlesTbl_WCTTableCoding_h
#import "ArticlesTbl.h"
#import <WCDB/WCDB.h>

@interface ArticlesTbl (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(localID)
WCDB_PROPERTY(link)
WCDB_PROPERTY(status)

@end
#endif /* ArticlesTbl_WCTTableCoding_h */

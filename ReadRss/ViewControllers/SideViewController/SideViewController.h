//
//  SideViewController.h
//  ReadRss
//
//  Created by cheng on 2018/11/15.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FakerNavbarViewController.h"

typedef NS_ENUM(NSInteger, SideNavType){
    SideNavType_Home = 0,
    SideNavType_Like = 1,
    SideNavType_List = 2,
};

NS_ASSUME_NONNULL_BEGIN

@interface SideViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>



@end

NS_ASSUME_NONNULL_END

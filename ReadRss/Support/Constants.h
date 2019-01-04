//
//  Constants.h
//  ReadRss
//
//  Created by cheng on 2018/10/19.
//  Copyright © 2018 cheng. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define AppName @"ReadRss"


#ifndef RGBACOLOR
#  define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#endif
#define WhiteColor             RGBACOLOR(255.0,255.0,255.0,1.0)
#define ClearColor             [UIColor clearColor]


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define IS_IPHONE_X  (ScreenWidth == 375 && ScreenHeight == 812)
#define IS_IPHONE_4_OR_LESS (INTERFACE_IS_PHONE && ScreenHeight < 568.0)
#define IS_IPHONE_5 (INTERFACE_IS_PHONE && ScreenHeight == 568.0)
#define IS_IPHONE_6 (INTERFACE_IS_PHONE && ScreenHeight == 667.0)
#define IS_IPHONE_6P (INTERFACE_IS_PHONE && ScreenHeight == 736.0)

#define kIphoneBottomMargin (IS_IPHONE_X ? 34.f : 0.f)
#define kIphoneTopMargin (IS_IPHONE_X ? 24.f : 0.f)
#define kIphoneStatusBarHeight (kIphoneTopMargin + 20.f)
#define kIphoneNavigationBarHeight 44.f
#define kIphoneStatusAndNavigationHeight (kIphoneStatusBarHeight + kIphoneNavigationBarHeight)
#define kIphoneTabBarHeight (kIphoneBottomMargin + 49.f)

#define kRelativeHeigthByIphone6 (ScreenHeight/667.0f)
#define kRelativeWidthByIphone6 (ScreenWidth/375.0f)

#define kScale ((ScreenWidth/ScreenHeight > 375.0/667.0)?([UIScreen mainScreen].bounds.size.height/667.0): ([UIScreen mainScreen].bounds.size.width/375.0))


#define GLOBAL_FONT_SIZE(f)  [UIFont fontWithName:@"SourceHanSansCN-Regular" size:(f)] ? :[UIFont systemFontOfSize:(f)]
#define GLOBAL_BOLD_FONT_SIZE(f)  [UIFont fontWithName:@"SourceHanSansCN-Bold" size:(f)] ?: [UIFont boldSystemFontOfSize:(f)]
#define GLOBAL_LIGHT_FONT_SIZE(f) [UIFont fontWithName:@"SourceHanSansCN-Light" size:(f)]?: [UIFont systemFontOfSize:(f)]

#define WEAK_SELF   typeof(self) __weak weakSelf = self;
#define STRONG_SELF typeof(weakSelf) __strong strongSelf  = weakSelf;


#define kNotificationAddRss  @"NotificationAddRss"
#define kNotificationChangeTab @"NotificationChangeTab"


#define ROUTER_HOME @"RD://home"
#define ROUTER_LIKE @"RD://like"
#define ROUTER_ARTICLE_LIST  @"RD://articleList"
#define ROUTER_ARTICLE_DETAIL @"RD://articleDetail"
#endif /* Constants_h */

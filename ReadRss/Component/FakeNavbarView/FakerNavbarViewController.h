//
//  FakerNavbarViewController.h
//  ReadRss
//
//  Created by cheng on 2018/10/26.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ onLeftClick)(void);

@interface FakerNavbarViewController : UIViewController


@property(strong, nonatomic) UIView *navbarView;
@property(strong, nonatomic) UIView *contentView;
@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UIButton *leftBtn;
@property(strong, nonatomic) UIButton *rightBtn;


- (void) setLeftBtnIcon: (UIImage *) icon;
- (void) setRightBtnIcon: (UIImage *) icon;

@end

NS_ASSUME_NONNULL_END

//
//  AddLinkViewController.h
//  ReadRss
//
//  Created by cheng on 2018/10/29.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddLinkViewController : UIViewController

@property(strong, nonatomic) UIView *maskView;
@property(strong, nonatomic) UIView *contentView;

@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UITextField *input;

@property(strong, nonatomic) UIButton *okBtn;
@property(strong, nonatomic) UIButton *cancelBtn;
@end


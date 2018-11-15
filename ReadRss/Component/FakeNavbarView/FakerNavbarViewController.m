//
//  FakerNavbarViewController.m
//  ReadRss
//
//  Created by cheng on 2018/10/26.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "FakerNavbarViewController.h"
#import "SideViewController.h"

@interface FakerNavbarViewController ()

@end

@implementation FakerNavbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    [self initBaseView];
}

- (void) initBaseView {
    [self.view addSubview:self.navbarView];
    
    [self.navbarView addSubview:self.titleLabel];

    [self.navbarView addSubview:self.leftBtn];
    [self.navbarView addSubview:self.rightBtn];
    
    [self.view addSubview:self.contentView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIView *)navbarView {
    if(!_navbarView) {
        _navbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, kIphoneStatusAndNavigationHeight)];
        _navbarView.backgroundColor = [UIColor whiteColor];
        _navbarView.layer.borderColor = RGBACOLOR(198, 198, 198, 1.0).CGColor;
        _navbarView.layer.borderWidth = 0.5;
        _navbarView.userInteractionEnabled = YES;
    }
    return _navbarView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kIphoneStatusBarHeight, ScreenWidth, kIphoneNavigationBarHeight)];
        _titleLabel.text = @"title";
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textColor = RGBACOLOR(68, 68, 68, 1.0);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}

- (UIButton *)leftBtn {
    if(!_leftBtn) {
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        _leftBtn.center = CGPointMake(30, kIphoneNavigationBarHeight/2 + kIphoneStatusBarHeight);
        [_leftBtn setImage:[UIImage imageNamed:@"ic_add"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(onLeftClick) forControlEvents:UIControlEventTouchDown];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if(!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
        _rightBtn.center = CGPointMake(ScreenWidth - 30, kIphoneNavigationBarHeight/2 + kIphoneStatusBarHeight);
        [_rightBtn setImage:[UIImage imageNamed:@"ic_navbar_setting"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(onRightClick) forControlEvents:UIControlEventTouchDown];
    }
    return _rightBtn;
}

- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0,kIphoneStatusAndNavigationHeight, ScreenWidth, ScreenHeight - kIphoneStatusAndNavigationHeight)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
////////////////////

- (void) setTitle: (NSString *) str {
    self.titleLabel.text = str;
}

- (void) setLeftBtnIcon: (UIImage *) icon {
    [self.leftBtn setImage:icon forState:UIControlStateNormal];
}

- (void) setRightBtnIcon: (UIImage *) icon {
     [self.rightBtn setImage:icon forState:UIControlStateNormal];
}

- (void) onLeftClick {
}

- (void) onRightClick {
}

- (void) openLeftSide {
    SideViewController *vc = [[SideViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:NO completion:nil];
}
@end

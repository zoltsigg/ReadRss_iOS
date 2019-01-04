//
//  AddLinkViewController.m
//  ReadRss
//
//  Created by cheng on 2018/10/29.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "AddLinkViewController.h"
#import <Masonry/Masonry.h>
#import "NetworkClient.h"
#import "RssInfoModel.h"
#import "DataManager.h"
#import <pop/POP.h>

@interface AddLinkViewController ()

@end

@implementation AddLinkViewController

- (instancetype)init {
    if(self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) createUI {
    [self.view addSubview:self.maskView];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(320*kScale));
        make.height.mas_equalTo(@(210*kScale));
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(80*kScale));
        make.height.equalTo(@(30*kScale));
        make.top.mas_equalTo(self.contentView.mas_top).offset(24*kScale);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    [self.contentView addSubview:self.input];
    [self.input mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(252*kScale));
        make.height.equalTo(@(45*kScale));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20*kScale);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    [self.contentView addSubview:self.okBtn];
    [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100*kScale));
        make.height.equalTo(@(40*kScale));
        make.right.mas_equalTo(self.input.mas_right);
        make.top.mas_equalTo(self.input.mas_bottom).offset(30*kScale);
    }];
    
    [self.contentView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100*kScale));
        make.height.equalTo(@(40*kScale));
        make.left.mas_equalTo(self.input.mas_left);
        make.top.mas_equalTo(self.input.mas_bottom).offset(30*kScale);
    }];
    
//    self.contentView.transform = CGAffineTransformMakeScale(0, 0);
//    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        self.contentView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//
//    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    self.contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}



- (UIView *)maskView {
    if(!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.75;
    }
    return _maskView;
}

- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 6;
    }
    return _contentView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"RSS地址";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:18*kScale];
    }
    return _titleLabel;
}

- (UITextField *)input {
    if(!_input) {
        _input = [[UITextField alloc] init];
        _input.layer.cornerRadius = 5*kScale;
        _input.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
        _input.leftViewMode = UITextFieldViewModeAlways;
        _input.layer.borderColor = [UIColor blackColor].CGColor;
        _input.layer.borderWidth = 1.0f;
        _input.placeholder = @"http://";
    }
    
    return _input;
}

- (UIButton *)okBtn {
    if(!_okBtn) {
        _okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _okBtn.frame = CGRectMake(0, 0, 90, 35);
        [_okBtn setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(45, 83, 220, 1.0)] forState:UIControlStateNormal];
        _okBtn.layer.cornerRadius = 5*kScale;//2.0是圆角的弧度，根据需求自己更改
        _okBtn.layer.masksToBounds = YES;
        [_okBtn setTitle:@"确定" forState:UIControlStateNormal];
        _okBtn.titleLabel.textColor = [UIColor whiteColor];
        _okBtn.titleLabel.font = [UIFont systemFontOfSize:16*kScale];
        [_okBtn addTarget:self action:@selector(onOkClick) forControlEvents:UIControlEventTouchDown];
        
    }
    return _okBtn;
}

- (UIButton *)cancelBtn {
    if(!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(197, 202, 214, 1.0)] forState:UIControlStateNormal];
        _cancelBtn.frame = CGRectMake(0, 0, 90, 35);
        _cancelBtn.layer.cornerRadius = 5*kScale;//2.0是圆角的弧度，根据需求自己更改
        _cancelBtn.layer.masksToBounds = YES;
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancelBtn.titleLabel.textColor = [UIColor whiteColor];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16*kScale];
        [_cancelBtn addTarget:self action:@selector(onCancelClick) forControlEvents:UIControlEventTouchDown];
        
    }
    return _cancelBtn;
}

- (void) onOkClick {
    NSLog(@"onOkClick");
    NSString *link = self.input.text;
    
    if(link.length == 0) {
        [self.view makeToast:@"链接不能为空"];
    } else {
//        JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
//        HUD.textLabel.text = @"Loading";
//        [HUD showInView:self.view];
        [self.view makeToastActivity:CSToastPositionCenter];
        [[NetworkClient sharedInstance] addRss:self.input.text callback:^(BOOL isSuccess, RssInfoModel *data) {
            [self.view hideToastActivity];
            if(isSuccess) {
                //如果返回成功
                [self.view makeToast:@"添加成功"];
                
                NSMutableArray *arr = [DataManager sharedInstance].rssList.mutableCopy;
                [arr addObject:data];
                [[DataManager sharedInstance] setRssList:arr.copy];
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAddRss object:nil];
                
                [self onCancelClick];
            } else {
                [self.view makeToast:@"添加失败,请稍后再试"];
            }
        }];
    }
    
   
}

- (void) onCancelClick {
    [self onClose];
}


- (void) onClose {
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.transform = CGAffineTransformMakeScale(0.4, 0.4);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

@end

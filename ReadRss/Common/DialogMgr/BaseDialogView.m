//
//  BaseDialogView.m
//
//
//  Created by cheng on 2018/12/24.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "BaseDialogView.h"
#import "Constants.h"

#define DefaultWidth 318*kScale
#define DefaultHeight 370*kScale

@implementation BaseDialogView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void) viewDidLoad {
    [super viewDidLoad];
    [self _createUI];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.closeBtn.alpha = 0;
    self.closeBtn.transform = CGAffineTransformMakeScale(0, 0);
    self.contentView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
        self.contentView.alpha = 1.0f;
        self.closeBtn.alpha = 1.0f;
        self.closeBtn.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.maskView.alpha = 0.75f;
        self.closeBtn.hidden = NO;
        self.closeBtn.alpha = 1.0f;
        self.closeBtn.transform = CGAffineTransformIdentity;
    }];
}

- (instancetype) initWH: (NSInteger) width height:(NSInteger) height {
    if(self == [super init]) {
        self.width = width;
        self.height = height;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (instancetype) init {
    if(self = [super init]) {
        self.width = DefaultWidth;
        self.height = DefaultHeight;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (void) _createUI {
    self.view.userInteractionEnabled = YES;
    [self.view addSubview:self.maskView];
    
    self.contentView.frame = CGRectMake(0, 0, self.width, self.height);
    self.contentView.center = CGPointMake(ScreenWidth/2,ScreenHeight/2);
    [self.view addSubview:self.contentView];
    
    self.closeBtn.center = CGPointMake(ScreenWidth/2 + self.width/2, ScreenHeight/2 - self.height/2 - 40);
    [self.view addSubview:self.closeBtn];
    
    [self setContentUI];
}

- (void) setContentUI {
    
}

- (UIView *)maskView {
    if(!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.75;
        _maskView.userInteractionEnabled = YES;
        UITapGestureRecognizer *maskTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMaskClick)];
        [_maskView addGestureRecognizer:maskTap];
    }
    return _maskView;
}

- (UIView *) contentView {
    if(!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.frame = CGRectMake(0, 0, 318*kScale, 370*kScale);
        _contentView.layer.cornerRadius = 15*kScale;
        _contentView.backgroundColor = [UIColor whiteColor];
        
    }
    return _contentView;
}


- (UIButton *)closeBtn {
    if(!_closeBtn) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"icClose"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchDown];
        _closeBtn.frame = CGRectMake(0, 0, 32*kScale, 32*kScale);
    }
    return _closeBtn;
}

- (void) onMaskClick {
    if(self.isMaskCanClick) {
        [self close];
    }
}


- (void) close {
    self.maskView.alpha = 0.75;
    self.closeBtn.hidden = YES;
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.transform = CGAffineTransformMakeScale(0.4, 0.4);
        self.maskView.alpha = 0;
        self.contentView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            if(self.callback) {
                self.callback();
            }
        }];
        
    }];
}


- (void) confirm {
    [self confirm:nil];
}

- (void) confirm:(__nullable id) data {
    self.maskView.alpha = 0.75;
    self.closeBtn.hidden = YES;
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.transform = CGAffineTransformMakeScale(0.4, 0.4);
        self.maskView.alpha = 0;
        self.contentView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            if(self.confirmCallback) {
                self.confirmCallback(data);
            }
        }];
        
    }];
}
@end

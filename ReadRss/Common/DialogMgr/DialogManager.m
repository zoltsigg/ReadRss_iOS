//
//  DialogMgr.m
//  ReadRss
//
//  Created by cheng on 2018/12/24.
//  Copyright © 2018 cheng. All rights reserved.
//

#import "DialogManager.h"

@implementation DialogManager

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static DialogManager *_shareInstance = nil;
    dispatch_once(&onceToken, ^{
        if(!_shareInstance) {
            _shareInstance = [[DialogManager alloc] init];
            [_shareInstance commitInit];
        }
    });
    return _shareInstance;
}

- (void) commitInit {
    self.list = [[NSMutableArray alloc] init];
    self.isShow = NO;
}

- (void) show:(UIViewController *) vc contentView:(BaseDialogView *) content close:(__nullable OnCloseCallback) callback confirm:(__nullable onConfirmCallback) confirm {
    
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"vc"] = vc;
    param[@"content"] = content;
    if(callback) {
        param[@"callback"] = callback;
    }
    if(confirm) {
        param[@"confirmCallback"] = confirm;
    }
    
    [self.list addObject:param.copy];
    if(!self.isShow && [self.list count] == 1) {
        [self show];
    }
    
}

- (void) show {
    if([self.list count] == 0 || self.isShow) {
        return ;
    }
    NSDictionary *obj = [self.list objectAtIndex:0];
    [self.list removeObjectAtIndex:0];
    
    self.isShow = YES;
    UIViewController *vc = obj[@"vc"];
    //    self.currentVC = vc;
    BaseDialogView *content = obj[@"content"];
    OnCloseCallback callback1 = obj[@"callback"];
    onConfirmCallback onConfirmCallback = obj[@"confirmCallback"];
    
    WEAK_SELF
    content.callback = ^{
        weakSelf.isShow = NO;
        if(callback1) {
            callback1();
        }
        [weakSelf show];
    };
    content.confirmCallback = ^(id _Nullable data) {
        weakSelf.isShow = NO;
        if(onConfirmCallback) {
            onConfirmCallback(data);
        }
        [weakSelf show];
    };
    [vc presentViewController:content animated:NO completion:nil];
    
}


@end

//
//  DialogMgr.h
//
//  Created by cheng on 2018/12/24.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDialogView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DialogManager : NSObject

@property(nonatomic, strong) NSMutableArray *list;
@property(nonatomic, assign) BOOL isShow;

@property(nonatomic, strong) UIViewController *currentVC;

+ (instancetype) sharedInstance;

- (void) show:(UIViewController *) vc contentView:(BaseDialogView *) content close:(__nullable OnCloseCallback) callback confirm:(__nullable onConfirmCallback) confirm;
- (void) close:(Class) dialog;
@end

NS_ASSUME_NONNULL_END

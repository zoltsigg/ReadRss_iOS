//
//  BaseDialogView.h
//
//  Created by cheng on 2018/12/24.
//  Copyright © 2018 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ OnCloseCallback)(void);
typedef void (^ onConfirmCallback) (__nullable id data);

NS_ASSUME_NONNULL_BEGIN

@interface BaseDialogView : UIViewController

@property(nonatomic, strong) UIView *maskView;
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UIButton *closeBtn;

@property(nonatomic, copy) OnCloseCallback callback;
@property(nonatomic, copy) onConfirmCallback confirmCallback;

@property(nonatomic, assign) NSInteger width;
@property(nonatomic, assign) NSInteger height;

@property(nonatomic, assign) BOOL isMaskCanClick;

- (void) close;
- (void) confirm;
- (void) confirm:(__nullable id) data;

- (instancetype) initWH: (NSInteger) width height:(NSInteger) height;
- (void) setContentUI;
@end

NS_ASSUME_NONNULL_END

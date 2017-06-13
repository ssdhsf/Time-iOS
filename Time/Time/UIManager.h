//
//  UIManager.h
//  Time
//
//  Created by huangli on 2017/4/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIManager : NSObject

+ (instancetype)sharedUIManager;

+ (AppDelegate *)appDelegate;
+ (UIWindow *)keyWindow;
+ (UIWindow *)newWindow;

/**
 *  显示主窗口
 */
+ (void)makeKeyAndVisible;

/**
 *  进入主界面
 */
//+ (void)goMianViewController;
//设置状态栏
+ (void)setStatusBarStyle;

/**
 *  注册Nib
 *
 *  @return Nib
 */
- (UINib *)nibWithNibName:(NSString*)nibName;

@end

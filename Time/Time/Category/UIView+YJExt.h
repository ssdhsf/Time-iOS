//
//  UIView+YJExt.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJExt)
/** 当前控制器 */
- (UIViewController *)yj_currentViewController;
/** 倒角 */
- (void)yj_clipLayerWithRadius:(CGFloat) r width:(CGFloat) w color:(UIColor *) color;
#pragma mark Frame操作
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end

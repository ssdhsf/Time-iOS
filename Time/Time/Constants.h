//
//  Constants.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//屏幕尺寸
#define C_ScreenBounds     ([UIScreen mainScreen].bounds)
#define C_ScreenWidth      C_ScreenBounds.size.width
#define C_ScreenHeight     C_ScreenBounds.size.height
#define C_NavigationBarHeight     64
#define C_StatusBarHeight         20
#define C_TabBarHeight            49

#define weakSelf(wSelf)  __block __typeof(&*self)wSelf = self
// 日志文件
#ifndef __OPTIMIZE__
#define C_NSLog(...) NSLog(@"*************************\n%s\n%d\n%@\n*************************",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define C_NSLog(...) {}
#define NSLog(...) {}
#endif

#endif /* Constants_h */

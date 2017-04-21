//
//  Macros.h
//  Time
//
//  Created by 黄立 Poon on 17/04/21.
//  Copyright © 2017年 Time. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

// 当前设备的屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeigh [UIScreen mainScreen].bounds.size.height

//当前视图控制器View的宽度高度
#define ViewWidth self.view.frame.size.width
#define ViewHeigh self.view.frame.size.height

//自定义颜色
#define RGB(__R, __G, __B)                                                     \
  [UIColor colorWithRed:(__R) / 255.0f                                         \
                  green:(__G) / 255.0f                                         \
                   blue:(__B) / 255.0f                                         \
                  alpha:1.0]

// 请求类型
#define TYPE_POST    @"POST"
#define TYPE_GET     @"GET"
#define TYPE_PUT     @"PUT"
#define TYPE_DELETE  @"delete"


// 时间格式
#define TIME_HH_MM            @"HH:mm"
#define TIME_PATTERN_day      @"yyyy-MM-dd"
#define TIME_PATTERN_day_stye @"yyyy/MM/dd"
#define TIME_PATTERN_minute      [NSString stringWithFormat:@"%@  %@",TIME_PATTERN_day,TIME_HH_MM]
#define TIME_PATTERN_minute_stye [NSString stringWithFormat:@"%@  %@",TIME_PATTERN_day_stye,TIME_HH_MM]

#endif /* Macros_h */



//
//  Config.h
//  xixun
//
//  Created by Kongho Poon on 15/8/2.
//  Copyright (c) 2015年 3N. All rights reserved.
//

#ifndef Time_Config_h
#define Time_Config_h

// 保存不同环境配置信息的 PLIST 文件
#define CONFIG_PLIST [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"]
#define PUSHCONFIG_PLIST [[NSBundle mainBundle] pathForResource:@"PushConfig" ofType:@"plist"]
// 配置信息 dictionary
#define CONFIG_DICTIONARY [[NSDictionary alloc] initWithContentsOfFile:CONFIG_PLIST]
#define APP_KEY_DICTIONARY [[NSDictionary alloc] initWithContentsOfFile:PUSHCONFIG_PLIST]

// API 服务器域名配置 (ApiHost)
//    开发：Develop
//    测试：Testing
//    正式：Official
#define DEFAULT_API_HOST  CONFIG_DICTIONARY[@"ApiHost"][@"Official"]
#define APP_KEY  APP_KEY_DICTIONARY[@"APP_KEY"]

// 高德地图 (Gaode)
#define AMAPKEY           CONFIG_DICTIONARY[@"Gaode"][@"AMAPKEY"]//GaodeKey

// 友盟 (UMeng)
#define UMengAppKey       CONFIG_DICTIONARY[@"UMeng"][@"UMengAppKey"] //UmengKey
#define UMengChannel      CONFIG_DICTIONARY[@"UMeng"][@"UMengChannel"] // 应用名

//ShareSDK
#define ShareAppKey      CONFIG_DICTIONARY[@"Share"][@"ShareAppKey"]

//微信分享
#define WeiChatAppId      CONFIG_DICTIONARY[@"WeiChat"][@"WeiChatAppId"]
#define WeiChatAppSecret  CONFIG_DICTIONARY[@"WeiChat"][@"WeiChatAppSecret"]

//微博分享
#define SinaWeiboAppKey      CONFIG_DICTIONARY[@"SinaWeibo"][@"SinaWeiboAppKey"]
#define SinaWeiboSecret  CONFIG_DICTIONARY[@"SinaWeibo"][@"SinaWeiboSecret"]

//系统级参数:sys_client
#define sysClient         CONFIG_DICTIONARY[@"System"][@"SysClient"]



////数据接口KEY
//#define SECRETKEY @"SecretKey"
//
//// AFNeworking打印日志级别: 0-关闭, 1-Debug级别
//#define AF_LOG_LEVEL 1
//
////设置超时时间
//#define REQUEST_TIMEOUT 30
//
//// 登录帐户缓存有效期: 2小时
//#define XCacheValidity 7200
//
//// 列表加载数量
//#define XListCount 10
//
//// table headview 字体
//#define XTableHeadFont [UIFont systemFontOfSize:14]
//
//#define XContacterCellNameFont [UIFont systemFontOfSize:17]
//
//// 导航栏item字体
//#define XNavItemFont [UIFont systemFontOfSize:18]
//
//#define XSegAttributes [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil]
//
//#define SetNavItemStyle   \
//  setTitleTextAttributes: \
//  [NSDictionary dictionaryWithObjectsAndKeys:XNavItemFont, NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState : UIControlStateNormal
//
//
//// 错误类型
//#define IsInLoginView @"InLoginView" //标记是否在登陆页
//#define LogoutError @"40510"  //异地登陆
//#define TokenError  @"40511"  //令牌过期
//

#endif 



//
//  UIManager.m
//  Time
//
//  Created by huangli on 2017/4/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "UIManager.h"
#import "ThemeNavigationController.h"

@implementation UIManager

+ (instancetype)sharedUIManager{
    
    static UIManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc] init];
    });
    return manager;
}

+ (AppDelegate *)appDelegate{
    
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

+ (UIWindow *)keyWindow{
    
    return [[UIApplication sharedApplication] keyWindow];
}

+ (UIWindow *)newWindow{
    
    UIWindow * window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    return window;
}

+ (void)makeKeyAndVisible{
    
    [[self class] customNavAppearance];
    AppDelegate * appDelegate = [[self class] appDelegate];
    appDelegate.window = [[self class] newWindow];
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    ThemeNavigationController *nav1 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"HomeViewController"]];
    ThemeNavigationController *nav2 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"CodeViewController"]];
    ThemeNavigationController *nav3 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"MyInfoViewController"]];
    
    [nav1 setTitle:@"首页" tabBarItemImageName:@"tabbar_icon_home_default" tabBarItemSelectedImageName:@"tabbar_icon_home_default"];
    [nav2 setTitle:@"扫码" tabBarItemImageName:@"tabbar_icon_code_default" tabBarItemSelectedImageName:@"tabbar_icon_code_select"];
    [nav3 setTitle:@"我的" tabBarItemImageName:@"tabbar_icon_my_default" tabBarItemSelectedImageName:@"tabbar_icon_my_select"];
    NSArray*array = @[nav1,nav2,nav3];
    tabBarController.viewControllers = array;
//    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar_background_blue"]];
    appDelegate.tabBarController = tabBarController;
    
//    if([[UserManager shareUserManager] isLogin]) { //TODO判断用户是否登录  暂时不做
    
    appDelegate.window.rootViewController = appDelegate.tabBarController;
    [appDelegate.window makeKeyAndVisible];
    [appDelegate.window makeKeyAndVisible];
        
//    } else {  //进入登录页面
//        
//        ThemeNavigationController* loginNavigation = [[ThemeNavigationController alloc] initWithRootViewController:[[self class] viewControllerWithName:@"UnifiedLoginViewController"]];
//        appDelegate.window.rootViewController = loginNavigation;
//        [appDelegate.window makeKeyAndVisible];
//    }
    
}

+ (void)customNavAppearance{
    
    [[self class] setNavigationTitleWhiteColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
}

+ (void)setNavigationTitleWhiteColor{
    
    [[self class] setNavigationTitleColor:[UIColor whiteColor]];
}

+ (void)setNavigationTitleColor:(UIColor *)clr{
    
    if(clr == nil){
        
        clr = [UIColor blackColor];
    }
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:clr}];
}

+ (UIViewController *)viewControllerWithName:(NSString *)vcName{
    
    Class cls = NSClassFromString(vcName);
    UIViewController * vc = [[cls alloc] initWithNibName:vcName bundle:[NSBundle mainBundle]];
    return vc;
}

+ (void)setStatusBarStyle{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}


@end

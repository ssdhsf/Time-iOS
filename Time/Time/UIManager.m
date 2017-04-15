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
    ThemeNavigationController *nav1 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"ChatViewController"]];
    ThemeNavigationController *nav2 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"ContactsMainViewController"]];
//    ThemeNavigationController *nav3 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"ApplicationMainViewController"]];
//    ThemeNavigationController *nav4 = [[ThemeNavigationController alloc]initWithRootViewController:[[self class] viewControllerWithName:@"MineMainViewController"]];
    
    [nav1 setTitle:@"扫码" tabBarItemImageName:@"tabbar_icon_home_default" tabBarItemSelectedImageName:@"tabbar_icon_home_selected"];
    [nav2 setTitle:@"我的" tabBarItemImageName:@"tabbar_icon_contact_default" tabBarItemSelectedImageName:@"tabbar_icon_contact_selected"];
    NSArray*array = @[nav1,nav2];
    tabBarController.viewControllers = array;
//    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar_background_blue"]];
    appDelegate.tabBarController = tabBarController;
    
//    if([[UserManager shareUserManager] isLogin]) { //TODO判断用户是否登录  暂时不做
    
    appDelegate.window.rootViewController = appDelegate.tabBarController;
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


@end
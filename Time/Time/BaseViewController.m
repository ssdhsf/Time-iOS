//
//  BaseViewController.m
//  xixun
//
//  Created by Apple on 15-8-3.
//  Copyright (c) 2015年 3N. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_background_blue"]forBarMetrics:UIBarMetricsDefault];

    [self setLeftCustomBarItem:@"icon_back" action:@selector(back)];
        [self hideNavigationBlackLine];
    [self addSwipeBack];
    [self initData];
    [self initView];
    [self initNavigationBarItems];
    
#ifdef iOS7_SDK
    if([[UIDevice currentDevice].systemVersion floatValue])
    {
        if([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            [self setEdgesForExtendedLayout:UIRectEdgeNone];
            [self setExtendedLayoutIncludesOpaqueBars:NO];
            [self prefersStatusBarHidden];
            [self preferredStatusBarStyle];
            [self setNeedsStatusBarAppearanceUpdate];
        }
    }
#endif
    self.wantsFullScreenLayout = NO;
 
}

- (void)viewWillAppear:(BOOL)animated {
   
    [super viewWillAppear:animated];
    // 针对搜索列表点击进去后的情况
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    //友盟统计页面
    NSString *className= NSStringFromClass(self.class);
    [MobClick beginLogPageView:className];
 }

- (void)viewWillDisappear:(BOOL)animated {
   
    [super viewWillDisappear:animated];
    
    //友盟统计页面
    NSString *className= NSStringFromClass(self.class);
    [MobClick endLogPageView:className];
}

#pragma mark - 初始化数据,由子类重写改方法
- (void)initData {
}

#pragma mark - 初始化View,由子类重写改方法
- (void)initView {
}

#pragma mark - 初始化navigationBar,由子类重写改方法
- (void)initNavigationBarItems {
}

#pragma mark - 手势返回上级视图
- (void)addSwipeBack {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [self.view addGestureRecognizer:swipe];
}

#pragma mark - 隐藏导航栏下的黑线
- (void)hideNavigationBlackLine {
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
}

#pragma mark - 返回
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

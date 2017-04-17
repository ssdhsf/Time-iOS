//
//  ThemeNavigationController.m
//  xixun
//
//  Created by huangli on 16/9/1.
//  Copyright © 2016年 3N. All rights reserved.
//

#import "ThemeNavigationController.h"
#import "ThemeManager.h"

@interface ThemeNavigationController ()

@end

@implementation ThemeNavigationController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //监听主题切换的通知
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadThemeImage];
    self.delegate = self;
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)loadThemeImage{
    
    [self.navigationBar setBackgroundImage:[[ThemeManager shareInstance]getThemeImage:@"navigationBar_background_blue"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:[[ThemeManager shareInstance]getThemeImage:@"navigationBar_background_blue"] forBarMetrics:UIBarMetricsDefault];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([navigationController isKindOfClass:[UIImagePickerController class]]) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
}

-(void)setTitle:(NSString *)title tabBarItemImageName:(NSString *)imageName tabBarItemSelectedImageName:(NSString *)selectedImageName{
    
    self.tabBarItem.title = title ;
    self.tabBarItem.image=[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
}

@end

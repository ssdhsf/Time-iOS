//
//  HomeViewController.m
//  Time
//
//  Created by huangli on 2017/4/19.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)initNavigationBarItems{
    
    [super initNavigationBarItems];
//    [self setLeftCustomBarItem:@"location" action:nil];
    UIBarButtonItem *item1 = [self customBarItem:@"location" action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"花都" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setLeftBarButtonItems:@[item1, item2]];
    self.title = @"首页";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

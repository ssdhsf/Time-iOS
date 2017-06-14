//
//  ScanViewController.m
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "ScanViewController.h"
#import "YJ_ScanView.h"

@interface ScanViewController ()<YJ_ScanViewDelegate>;

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    YJ_ScanView *scanView = [YJ_ScanView scanView];
    [self.view addSubview:scanView];
    [scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    scanView.delegate = self;
}

#pragma mark - YJ_ScanViewDelegate
- (void)yj_scanView:(YJ_ScanView *)scanView didScanedResult:(NSString *)scanedResult{
    C_NSLog(@"%@",scanedResult);
    if (self.ScanBlock) {
        self.ScanBlock(scanedResult);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end

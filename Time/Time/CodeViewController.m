//
//  CodeViewController.m
//  Time
//
//  Created by huangli on 2017/4/17.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "CodeViewController.h"
#import "ScanViewController.h"

@interface CodeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView yj_clipLayerWithRadius:0 width:1 color:[UIColor lightGrayColor]];
}

- (void)initNavigationBarItems{
    [super initNavigationBarItems];
    self.title = @"扫码";
}
- (IBAction)scanAction:(UIButton *)sender {
    ScanViewController *scanVC = [[ScanViewController alloc] init];
    weakSelf(wSelf);
    scanVC.ScanBlock = ^(NSString *scanResult){
        wSelf.textView.text = scanResult;
    };
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:scanVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

@end

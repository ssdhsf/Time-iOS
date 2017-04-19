//
//  BaseViewController.h
//  xixun
//
//  Created by Apple on 15-8-3.
//  Copyright (c) 2015年 3N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL hasData;
@property (nonatomic, assign) NSInteger showViewType;
@property (nonatomic, strong) UIView *hideView;
@property (nonatomic, strong) UIImageView *showImg;
@property (nonatomic, strong) UILabel *tipsLab;

- (void)initView;
- (void)initNavigationBarItems;
- (void)initData;
- (void)back;

@end

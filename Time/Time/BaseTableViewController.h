//
//  BaseTableViewController.h
//  Time
//
//  Created by huangli on 2017/4/21.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseTableViewDataSource;

@interface BaseTableViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray; //数据
@property (nonatomic, assign) NSInteger page_no; //加载页

@property (nonatomic) BOOL showRefreshHeader;//是否支持下拉刷新
@property (nonatomic) BOOL showRefreshFooter;//是否支持上拉加载
@property (nonatomic) BOOL showTableBlankView;//是否显示无数据时默认背景

- (void)tableViewDidTriggerHeaderRefresh;//下拉刷新事件
- (void)tableViewDidTriggerFooterRefresh;//上拉加载事件
- (void)showRefresh;//是否支持下拉上拉刷新数据

/**
 *  加载tableView视图
 *
 *  @param frame 初始化tableViewFrame大小
 */
- (void)initTableViewWithFrame:(CGRect )frame;

/**
 *  结束头视图和脚视图loading
 */
- (void)tableViewEndRefreshing;

/**
 *  下拉刷新
 */
- (void)tableViewbeginRefreshing;

/**
 *  TableView指定代理
 */
- (void)steupTableViewWithDataSource:(BaseTableViewDataSource *)dataSource
                      cellIdentifier:(NSString *)identifier
                             nibName:(NSString *)nibName;

@end

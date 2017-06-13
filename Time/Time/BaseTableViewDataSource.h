//
//  BaseTableViewDataSource.h
//  Time
//
//  Created by huangli on 2017/4/21.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewDataSource :NSObject<UITableViewDataSource>

typedef void (^TableViewCellConfigureBlock)(id cell, id data, id indexPath);

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)aCellIdentifier
           cellConfigureBlock:(TableViewCellConfigureBlock)aConfigureBlock;

-(id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

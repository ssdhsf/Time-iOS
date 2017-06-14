//
//  ScanViewController.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "BaseViewController.h"

@interface ScanViewController : BaseViewController
@property (copy,nonatomic) void (^ScanBlock) (NSString *scanResult);
@end

//
//  YJ_ScanView.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YJ_ScanView;
@protocol YJ_ScanViewDelegate <NSObject>

@optional
- (void)yj_scanView:(YJ_ScanView *) scanView didScanedResult:(NSString *) scanedResult;

@end
@interface YJ_ScanView : UIView
@property (nonatomic,assign) id<YJ_ScanViewDelegate> delegate;
+ (instancetype)scanView;
@end

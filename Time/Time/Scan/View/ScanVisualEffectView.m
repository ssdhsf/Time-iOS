//
//  ScanVisualEffectView.m
//  FastShopping
//
//  Created by 刘亚军 on 16/9/25.
//  Copyright © 2016年 刘亚军. All rights reserved.
//

#import "ScanVisualEffectView.h"

@implementation ScanVisualEffectView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO; // 设置为透明的
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO; // 设置为透明的
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [[UIColor colorWithWhite:0 alpha:0.5] setFill]; // 设置颜色为黑色
    // 半透明区域
    UIRectFill(rect);   // 向当前绘图环境所创建的内存中的图片上填充一个矩形
    CGFloat w = rect.size.width*0.6;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w)/2;
    CGFloat y = (rect.size.height - h)/2;
    // 透明区域
    CGRect clearRect = CGRectMake(x, y, w, h);
    // 两个视图相交的区域
    CGRect clearIntersection = CGRectIntersection(clearRect, rect);
    // 相交的区域设置为透明
    [[UIColor clearColor] setFill];
    // 把透明视图填充在图片上
    UIRectFill(clearIntersection);
}


@end

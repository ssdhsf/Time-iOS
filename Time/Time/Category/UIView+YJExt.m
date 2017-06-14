//
//  UIView+YJExt.m
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "UIView+YJExt.h"

@implementation UIView (YJExt)
- (UIViewController *)yj_currentViewController{
    UIResponder *nextResponder;
    for (UIView *next = [self superview]; next; next = next.superview) {
        nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
- (void)yj_clipLayerWithRadius:(CGFloat)r width:(CGFloat)w color:(UIColor *)color{
    self.layer.cornerRadius = r;
    self.layer.borderWidth = w;
    self.layer.borderColor = color.CGColor;
    self.layer.masksToBounds = YES;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end

//
//  NSObject+YJExt.m
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "NSObject+YJExt.h"

@implementation NSObject (YJExt)
- (BOOL)yj_isEmptyObj{
    if (self == nil) return YES;
    if ([self isEqual:[NSNull null]]) return YES;
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str = (NSString *)self;
        if ([str isEqualToString:@""]) return YES;
        return NO;
    }else if ([self isKindOfClass:[NSArray class]]){
         NSArray *arr = (NSArray *)self;
        if (arr.count == 0) return YES;
        return NO;
    }else if ([self isKindOfClass:[NSDictionary class]]){
        NSDictionary *dic = (NSDictionary *)self;
        if (dic.count == 0) return YES;
        return NO;
    }else{
       return NO;
    }
}
+ (instancetype)yj_loadBundleNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil] lastObject];
}
@end

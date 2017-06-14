//
//  NSError+YJExt.m
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "NSError+YJExt.h"

@implementation NSError (YJExt)
+ (instancetype)yj_localErrorWithCode:(NSInteger)code description:(NSString *)description{
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:description};
    NSError *error = [NSError errorWithDomain:kYJLocalErrorDamain code:code userInfo:userInfo];
    return error;
}
@end

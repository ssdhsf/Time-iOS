//
//  NSDate+YJExt.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YJExt)
- (NSString *)yj_string;

- (NSString *)yj_stringDate;

- (NSString *)yj_stringWithFormat:(NSString *)format;

- (NSDateComponents *)yj_dateComponents;

- (NSDate *)yj_dayBegin;

- (NSDate *)yj_dayEnd;
@end

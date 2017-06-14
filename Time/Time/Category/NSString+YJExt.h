//
//  NSString+YJExt.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJExt)
#pragma mark - URL处理
/** URL编码 UTF8 */
- (NSString *)yj_urlEncode;

/** URL解码 UTF8 */
- (NSString *)yj_urlDecode;

/** URL参数解析 */
- (NSDictionary *)yj_parseUrlParameter;

/** 标准化URLString */
- (NSString *)yj_standardizedURLString;

#pragma mark - 时间处理
/** 按格式将字符串转为日期 */
- (NSDate *)yj_dateWithFormat:(NSString *)format;

/** 按"yyyy-MM-dd'T'HH:mm:ss.SSS"或"yyyy-MM-dd HH:mm:ss"格式将字符串转为日期 */
- (NSDate *)yj_date;

/** 将日期字符串按格式format处理 */
- (NSString *)yj_dateStringWithFormat:(NSString *)format;

/** yyyy-MM-dd */
- (NSString *)yj_dateString;

/** MM-dd */
- (NSString *)yj_shortDateString;

/** 将"yyyy-MM-dd HH:mm:ss"转为"MM/dd HH:mm" */
- (NSString *)yj_shortDateTimeString;
@end

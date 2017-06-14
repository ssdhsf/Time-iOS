//
//  NSString+YJExt.m
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "NSString+YJExt.h"

@implementation NSString (YJExt)
- (NSString *)yj_urlEncode {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)yj_urlDecode {
    return [self stringByRemovingPercentEncoding];
}

- (NSDictionary *)yj_parseUrlParameter {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSString *parameterUrl = self;
    NSArray *parameterArr = [parameterUrl componentsSeparatedByString:@"&"];
    for (NSString *parameter in parameterArr) {
        NSArray *parameterBoby = [parameter componentsSeparatedByString:@"="];
        if (parameterBoby.count == 2) {
            [dic setObject:parameterBoby[1] forKey:parameterBoby[0]];
        } else {
            NSLog(@"Invalid Parameter String");
            return nil;
        }
    }
    return dic;
}
- (NSString *)yj_standardizedURLString {
    NSURL *url = [NSURL URLWithString:self];
    NSString *scheme = url.scheme;
    NSString *host = url.host;
    NSNumber *port = url.port;
    NSString *path = url.path.stringByStandardizingPath;
    
    NSMutableString *stdURLStr = [NSMutableString string];
    if (scheme) {
        [stdURLStr appendFormat:@"%@://", scheme];
    }
    if (host) {
        [stdURLStr appendString:host];
    }
    if (port) {
        [stdURLStr appendFormat:@":%@", port];
    }
    if (path) {
        [stdURLStr appendString:path];
    }
    return stdURLStr;
}

- (NSDate *)yj_dateWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:self];
    return date;
}

- (NSDate *)yj_date {
    NSString *zelf = [self copy];
    if (zelf.length > 19) {
        zelf = [zelf substringToIndex:19];
    }
    if ([zelf containsString:@"T"]) {
        zelf = [zelf stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    }
    return [zelf yj_dateWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)yj_dateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self.yj_date];
}

- (NSString *)yj_dateString {
    return [self yj_dateStringWithFormat:@"yyyy-MM-dd"];
}

- (NSString *)yj_shortDateString {
    return [self yj_dateStringWithFormat:@"MM-dd"];
}

- (NSString *)yj_shortDateTimeString {
    return [self yj_dateStringWithFormat:@"MM-dd HH:mm"];
}

@end

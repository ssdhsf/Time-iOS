//
//  NSError+YJExt.h
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const kYJLocalErrorDamain = @"_YJLocalErrorDamain";
NS_ENUM(NSInteger) {
    YJLocalErrorUnknown = -1,
    
    //User
    YJLocalErrorTokenExpired = -1001,
    
    //Network
    YJLocalErrorNoNetwork = - 2000,
    YJLocalErrorApiServerCannotConnect = -2101,
    YJLocalErrorApiServerTimeout = -2102,
    
    YJLocalErrorRequestFailed = -2200,
    
    //DataTransform
    YJLocalErrorCannotParseJSON = -3101,
    YJLocalErrorCannotParseXML = -3102,
    
    //DataBase
    YJLocalErrorDataBase = -4000,
    
    //FileSystem
    YJLocalErrorFileManager = -5001,
    YJLocalErrorFileNotFound = -5002,
    YJLocalErrorFileEmpty = -5003,
    
    //Other
    YJLocalErrorIllegalParameter = -9001,
    YJLocalErrorValueNull = -9002,
    };

@interface NSError (YJExt)
+ (instancetype)yj_localErrorWithCode:(NSInteger)code description:(NSString *)description;
@end

//
//  NSString+NTES.h
//  NIMDemo
//
//  Created by chris on 15/2/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (NTES)
// 将字符串MD5加密
- (NSString *)stringToMD5:(NSString *)str;

//将字符串base64加密
- (NSString *)base64EncodeString:(NSString *)string;

//将账号和密码生成请求头参数
-(NSString*)getHttpHeadParts;


//获取文字的长度
-(CGFloat)widthWithText:(NSString *)text andFont:(NSInteger)font andHight:(CGFloat) height;

//获取文字的高度
-(CGFloat)heightWithText:(NSString *)text andFont:(NSInteger)font andWidth:(CGFloat) Width;


//NSDate转化成字符串
-(NSString *) timeWithDateString:(NSString *)dateString;


//根据时间判断状态
-(NSString *)compareEndTime:(NSString *)endTime;

//获取当前时间
-(NSString *)getCurrentDate;

//将几年几月几号转时间戳
-(NSString *)getDate:(NSString *)date;

//得到当前时间
- (NSDate *)getCurrentTime;

//比较时间大小
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

//时间戳转时间
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString;




@end

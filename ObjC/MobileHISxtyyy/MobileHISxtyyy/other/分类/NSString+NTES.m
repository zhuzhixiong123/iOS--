//
//  NSString+NTES.m
//  NIMDemo
//
//  Created by chris on 15/2/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NSString+NTES.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (NTES)
#pragma mark-------字符串MD5加密
- (NSString *)stringToMD5:(NSString *)str{
    //1.首先将字符串转换成UTF-8编码, 因为MD5加密是基于C语言的,所以要先把字符串转化成C语言的字符串
    const char *fooData = [str UTF8String];
    
    //2.然后创建一个字符串数组,接收MD5的值
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    //3.计算MD5的值, 这是官方封装好的加密方法:把我们输入的字符串转换成16进制的32位数,然后存储到result中
    CC_MD5(fooData, (CC_LONG)strlen(fooData), result);
    /**
     第一个参数:要加密的字符串
     第二个参数: 获取要加密字符串的长度
     第三个参数: 接收结果的数组
     */
    //4.创建一个字符串保存加密结果
    NSMutableString *saveResult = [NSMutableString string];
    
    //5.从result 数组中获取加密结果并放到 saveResult中
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x", result[i]];
    }
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     NSLog("%02X", 0x888);  //888
     NSLog("%02X", 0x4); //04
     */
    return saveResult;
}

#pragma mark------------字符串base64加密
- (NSString *)base64EncodeString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
    
}

//将账号和密码生成请求头参数
-(NSString*)getHttpHeadParts{
    NSString *username = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"mima"];

    //HTTP Basic Authentication
    NSString *authenticationString = [NSString stringWithFormat:@"%@:%@", username, password];
    NSData *authenticationData = [authenticationString dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authenticationValue = [authenticationData base64Encoding];

    return authenticationValue;
}


-(CGFloat)widthWithText:(NSString *)text andFont:(NSInteger)font andHight:(CGFloat) height{

    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    CGSize maxSize = CGSizeMake(MAXFLOAT, height);

    CGSize text_size = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return text_size.width;
}



-(NSString *)timeWithDateString:(NSString *)dateString{
    
    double dates = [dateString doubleValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dates];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    format.dateFormat = @"HH:mm";
    
    NSString *string = [format stringFromDate:date];
    
    return string;
}

//时间戳转化为时间NSDate
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}







- (NSString *)getDate:(NSString *)date
{
    NSDateFormatter* dateformatter = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateformatter setDateFormat:@"YYYY-MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date1 =[dateformatter dateFromString:date];
    
//    NSDate * senddate=[NSDate date];
//    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
//    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *  locationString=[dateformatter stringFromDate:date1];
    NSDate * now = [dateformatter dateFromString:locationString];
    //转成时间戳
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[now timeIntervalSince1970]*1000];
    return timeSp;
}



-(NSString *)compareEndTime:(NSString *)endTime {
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:mydate];
    
    double dates = [endTime doubleValue] / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dates];
    NSString *string = [dateFormatter stringFromDate:date];
    
    NSDate *dateA = [dateFormatter dateFromString:currentDateStr];
    NSDate *dateB = [dateFormatter dateFromString:string];
    //比较时间
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == 1) {
        string = @"已结束";
    }
    else{
        string = @"服务中";
    }
    return string;
}

//比较两个日期的大小  日期格式为2016-08-14 08：46：20
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd EEEE HH:mm"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

#pragma mark -得到当前时间
- (NSDate *)getCurrentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy.MM.dd EEEE HH:mm"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    
    NSLog(@"---------- currentDate == %@",date);
    return date;
}

-(NSString *)getCurrentDate{
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:mydate];

    return currentDateStr;
}


@end

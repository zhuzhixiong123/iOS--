//
//  ZXFirstModel.h
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/28.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXFirstModel : NSObject

@property(nonatomic,copy) NSString *titles;

+(ZXFirstModel*)modelWithDict:(NSDictionary *)dict;

@end

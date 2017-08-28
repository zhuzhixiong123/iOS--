//
//  ZXFirstModel.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/28.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXFirstModel.h"

@implementation ZXFirstModel

+(ZXFirstModel*)modelWithDict:(NSDictionary *)dict{

    ZXFirstModel *model = [[self alloc] init];
    model.titles = dict[@"titles"];
    return model;
}


@end

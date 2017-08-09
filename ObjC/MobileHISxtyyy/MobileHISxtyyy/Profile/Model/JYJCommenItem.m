//
//  JYJCommenItem.m
//  JYJSlideMenuController
//
//  Created by JYJ on 2017/6/16.
//  Copyright © 2017年 baobeikeji. All rights reserved.
//

#import "JYJCommenItem.h"

@implementation JYJCommenItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle {
    JYJCommenItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.subtitle = subtitle;
    return item;
}

@end

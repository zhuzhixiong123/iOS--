//
//  UIBarButtonItem+item.h
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/6.
//  Copyright © 2016年 xiaohei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
//这个方法不怎么理解
+(UIBarButtonItem*)itemWithImageName:(NSString*)imageName andSelName:(NSString*)selName target:(id)target action:(SEL)action;

+(UIBarButtonItem*)backItemWithImageName:(NSString*)imageName andHighName:(NSString*)selName target:(id)target action:(SEL)action andTitle:(NSString*)title;


@end

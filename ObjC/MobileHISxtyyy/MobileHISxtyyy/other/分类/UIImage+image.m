//
//  UIImage+image.m
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/5.
//  Copyright © 2016年 xiaohei. All rights reserved.
//设置图片不被渲染,为了抽取代码,将重复代码封装到分类里面

#import "UIImage+image.h"

@implementation UIImage (image)

+(UIImage*)imageOriWithName:(NSString*)name{
    UIImage *image = [UIImage imageNamed:name];
  return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    }
@end

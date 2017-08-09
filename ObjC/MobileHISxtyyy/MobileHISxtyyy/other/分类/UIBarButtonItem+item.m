//
//  UIBarButtonItem+item.m
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/6.
//  Copyright © 2016年 xiaohei. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)

//这个方法不怎么理解
+(UIBarButtonItem*)itemWithImageName:(NSString*)imageName andSelName:(NSString*)selName target:(id)target action:(SEL)action{

    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selName] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //为了解决直接将btn添加到UIBarButtonItem上点击范围扩大
    UIView *contView = [[UIView alloc]initWithFrame:btn.bounds];
    [contView addSubview:btn];
    
  return [[UIBarButtonItem alloc]initWithCustomView:contView];
    
}

+(UIBarButtonItem*)backItemWithImageName:(NSString*)imageName andHighName:(NSString*)HighName target:(id)target action:(SEL)action andTitle:(NSString*)title{

    //设置返回按钮
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:RGBACOLOR(77, 77, 77, 1.0) forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0,-12,0,0);
    [btn setImage:[UIImage imageNamed:HighName] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
   return  [[UIBarButtonItem alloc]initWithCustomView:btn];
    

}


@end

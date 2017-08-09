//
//  HMTabbarController.m
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/5.
//  Copyright © 2016年 xiaohei. All rights reserved.
//设置选中的文字颜色,只需设置一次,所以在load中写代码

#import "HMTabbarController.h"

#import "ZXMineController.h"
#import "ZXCureController.h"
#import "ZXDiscussController.h"




#import "UIImage+image.h"
#import "HMTabbar.h"
#import "HMNavController.h"

@interface HMTabbarController ()

@end

@implementation HMTabbarController

+(void)load{
    //获取UITabBarItem的appear属性(常用于夜间模式)
    UITabBarItem *item =  [UITabBarItem appearance];
    // 富文本可设置字体颜色、大小以及阴影等  创建可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = RGBACOLOR(76, 173, 76, 1.0);
    //设置字体大小,只有设置nolmal状态才有效
   
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //设置字体大小
    NSMutableDictionary *nolDict = [NSMutableDictionary dictionary];
    nolDict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:nolDict forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载子控制器
    [self addsubview];
   
    //替换系统的tabbar
    HMTabbar *tabBar =  [[HMTabbar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];

}
//移除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

-(void)addsubview{
    //加载精华
    HMNavController *vc1 = [[HMNavController alloc]initWithRootViewController:[[ZXCureController alloc]init]];
    vc1.tabBarItem.title = @"治疗";
    vc1.tabBarItem.image = [UIImage imageNamed:@"tab_bar_doc_service_normal"];
    //设置图片不被渲染
    vc1.tabBarItem.selectedImage = [UIImage imageOriWithName:@"tab_bar_doc_service_pressed"];
    [self addChildViewController:vc1];
    
    //加载新帖
    HMNavController *vc2 = [[HMNavController alloc]initWithRootViewController:[[ZXDiscussController alloc]init]];
    vc2.tabBarItem.title = @"讨论";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tab_bar_discover_normal"];
    vc2.tabBarItem.selectedImage = [UIImage imageOriWithName:@"tab_bar_discover_pressed"];
    [self addChildViewController:vc2];

  
    //加载我的
    HMNavController *vc5 = [[HMNavController alloc]initWithRootViewController:[[ZXMineController alloc]init]];
    vc5.tabBarItem.title = @"个人中心";
    vc5.tabBarItem.image = [UIImage imageNamed:@"tab_bar_usercenter_normal"];
    vc5.tabBarItem.selectedImage =[UIImage imageOriWithName:@"tab_bar_usercenter_pressed"];
    [self addChildViewController:vc5];

}


@end

//
//  HMTabbar.m
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/5.
//  Copyright © 2016年 xiaohei. All rights reserved.
//

#import "HMTabbar.h"



@interface HMTabbar ()

//@property(nonatomic,strong)UIButton *Pblikbtn;
//点击的按钮
@property(nonatomic,strong)UIControl *lastClickBtn;

@end

@implementation HMTabbar



-(void)layoutSubviews{
    [super layoutSubviews];
    
     NSInteger i = 0;
    for (UIControl *tabbarBtn in self.subviews) {
        //判断类型是否为tabbar
        if ([tabbarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            tabbarBtn.tag = i;
            //监听按钮的点击
            [tabbarBtn addTarget:self action:@selector(ViewClick:) forControlEvents:UIControlEventTouchUpInside];
            i++;
        }
        
    }
}

-(void)ViewClick:(UIControl*)tabbarBtn{
    
    if ((tabbarBtn.tag == 1)) {
        //发个通知,告知被点
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HMTabbarbuttonDidRepeatClickNotifacation" object:nil];
    }
}




@end

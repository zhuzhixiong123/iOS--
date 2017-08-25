//
//  HMNavController.m
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/6.
//  Copyright © 2016年 xiaohei. All rights reserved.
//

#import "HMNavController.h"


@interface HMNavController ()<UIGestureRecognizerDelegate>

@end

@implementation HMNavController

+(void)load{

   UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    bar.titleTextAttributes = dict;
    
    //设置导航条背景
//    [bar setBackgroundImage:[UIImage imageNamed:@"home_navigation_bar"] forBarMetrics:UIBarMetricsDefault];
//    [bar setTranslucent:YES];
    
    bar.barTintColor = mainColor;
    bar.barStyle = UIBarStyleBlack;


   

}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
   
}

//手势的代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    return self.childViewControllers.count > 1;

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    if (self.childViewControllers.count > 0) {
         viewController.hidesBottomBarWhenPushed = YES;
        //统一设置返回按钮
         viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImageName:@"icon_right_arrow" andHighName:@"icon_right_arrow" target:self action:@selector(clickBtn) andTitle:@"返回"];
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)clickBtn{
    [self popViewControllerAnimated:YES];
}

@end

//
//  testController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/9.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "testController.h"
#import "HMTabbarController.h"
@interface testController ()

@end

@implementation testController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBody];
    
   
}


-(void)loadBody{
    self.view.backgroundColor = [UIColor whiteColor];
self.navigationItem.title = @"test";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImageName:@"icon_right_arrow" andHighName:@"icon_right_arrow" target:self action:@selector(back) andTitle:@"返回"];

}

-(void)back{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"zhuzhu" object:nil
     ];
  

}


@end

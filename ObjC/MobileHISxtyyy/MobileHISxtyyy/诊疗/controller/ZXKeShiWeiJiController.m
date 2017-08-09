//
//  ZXKeShiWeiJiController.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXKeShiWeiJiController.h"

@interface ZXKeShiWeiJiController ()

@end

@implementation ZXKeShiWeiJiController

- (void)viewDidLoad {
    [super viewDidLoad];
 self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadBody];
}


-(void)loadBody{

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, Screen_H * 0.4, Screen_W, 30)];
    [label setText:@"暂无数据"];
    [label setFont:[UIFont systemFontOfSize:21]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];

    

}


@end

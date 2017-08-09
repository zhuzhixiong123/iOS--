//
//  ZXKeShiDetailController.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/27.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXKeShiDetailController.h"

@interface ZXKeShiDetailController ()<UIScrollViewDelegate>

@property(nonatomic,weak) UIView *headView;

@end

@implementation ZXKeShiDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpVc];
    [self loadHeadView];
    [self loadContView];
}

-(void)setUpVc{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"详细信息";

}

-(void)loadHeadView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, Screen_H, 120)];
    self.headView = headView;
    [headView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:headView];
    
}

-(void)loadContView{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), Screen_W, 44)];
    [titleView setBackgroundColor:HMColor];
    [self.view addSubview:titleView];
    
    //创建所有按钮
    
    
    
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), Screen_W, Screen_H - CGRectGetMaxY(titleView.frame))];
    scrollview.delegate = self;
    scrollview.pagingEnabled = YES;
    scrollview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollview];
    scrollview.contentSize = CGSizeMake(Screen_W * 5, 0);
    
}




















@end

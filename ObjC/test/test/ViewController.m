//
//  ViewController.m
//  test
//  Created by 志雄 朱 on 2017/8/3.
//  Copyright © 2017年 志雄 朱. All rights reserved.

#import "ViewController.h"
#import "UIView+SDAutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBody];
    
}


-(void)loadBody{

    UIView *head = [[UIView alloc] init];
    head.backgroundColor = [UIColor redColor];
    [self.view addSubview:head];
    

    head.sd_layout
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .topSpaceToView(self.view,100)
     .heightIs(100);

}














































@end

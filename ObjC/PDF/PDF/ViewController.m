//
//  ViewController.m
//  PDF
//
//  Created by 志雄 朱 on 2017/8/16.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test];
    

    
}















-(void)test{
    UIWebView *myWebView = [[UIWebView alloc] init];
    myWebView.frame = self.view.bounds;
    myWebView.backgroundColor = [UIColor whiteColor];
 
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"移动诊疗API文档" ofType:@"pdf"]];
    
//    NSURL *string = [NSURL fileURLWithPath:<#(nonnull NSString *)#>]
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    [myWebView loadRequest:request];
    //使文档的显示范围适合UIWebView的bounds
    [myWebView setScalesPageToFit:YES];
    
    NSLog(@"****%@--%@",myWebView,url);

}


@end





























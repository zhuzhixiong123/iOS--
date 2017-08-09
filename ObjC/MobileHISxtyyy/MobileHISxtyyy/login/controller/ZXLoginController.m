//
//  ZXLoginController.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXLoginController.h"
#import "HMTabbarController.h"

@interface ZXLoginController ()

@property(nonatomic,weak) UITextField *countF;
@property(nonatomic,weak) UITextField *mimaF;

@end

@implementation ZXLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBody];
}


-(void)loadBody{
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat image_w = 60;
    CGFloat image_h = 64;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((Screen_W - image_w) * 0.5, image_h, image_w, image_w)];
    imageView.backgroundColor = [UIColor greenColor];
    imageView.layer.cornerRadius = image_w * 0.5;
    [self.view addSubview:imageView];
    
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 20, Screen_W, 21)];
    [titleL setTextColor:RGBACOLOR(77, 77, 77, 1.0)];
    [titleL setText:@"湘潭市第一人民医院 - 医护版"];
    [titleL setFont:[UIFont systemFontOfSize:15]];
    [titleL setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:titleL];
    
    
    UITextField *countF = [[UITextField alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(titleL.frame) + 88, Screen_W - 50, 32)];
    countF.placeholder = @"请输入用户名";
    self.countF = countF;
    countF.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:countF];
    
    
    UITextField *mimaF = [[UITextField alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(countF.frame) + 25, Screen_W - 50, 32)];
    mimaF.placeholder = @"请输入密码";
    self.mimaF = mimaF;
    mimaF.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:mimaF];
    

    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(25, CGRectGetMaxY(mimaF.frame) + 25, Screen_W - 50, 35)];
    [loginBtn setBackgroundColor:RGBACOLOR(76, 173, 76, 1.0)];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.cornerRadius = 5;
    [self.view addSubview:loginBtn];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];

}


-(void)loginClick{
    if (self.countF.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入账号"];
        return;
    }
    else if (self.mimaF.text.length == 0){
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    
    
    [SVProgressHUD showWithStatus:@"正在登录。。。"];
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *urls = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/login?loginId=%@&password=%@",self.countF.text,self.mimaF.text];
    
[manger GET:urls parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      [SVProgressHUD dismiss];
    NSString*result = [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
      NSLog(@"**-%@",result);
    
    if ([result isEqualToString:@"true"]) {
        
        //登陆成功就把账号,密码保存起来
        [[NSUserDefaults standardUserDefaults] setObject:self.countF.text forKey:@"userID"];
        [[NSUserDefaults standardUserDefaults] setObject:self.mimaF.text forKey:@"mima"];
        
        HMTabbarController *barBv = [[HMTabbarController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = barBv;
        [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
    }
    
    else{
        [SVProgressHUD showErrorWithStatus:@"账号或密码错误"];
    
    }
    
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      [SVProgressHUD dismiss];

}];
    
}








@end

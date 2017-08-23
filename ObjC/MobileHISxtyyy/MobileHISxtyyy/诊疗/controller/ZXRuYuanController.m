//
//  ZXRuYuanController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXRuYuanController.h"

@interface ZXRuYuanController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

@end

@implementation ZXRuYuanController

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64 + 120 + 44, 0);
        _tableView = tableView;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self loadBody];
}


-(void)loadData{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
  
    NSString *tempString = @"2014-06-23%2010:31:00";
    NSString *urls = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/admission/%@",self.bianHaoID,tempString];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];

    [maneger GET:urls parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@ ",[responseObject class] );
        [SVProgressHUD dismiss];
        
        NSDictionary *dict = responseObject;
        
        NSLog(@"%@",dict[@"content"]);
        
        NSDictionary *mainDict = dict[@"content"];
        
        NSLog(@"%@",mainDict[@"个人史:"]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           [SVProgressHUD dismiss];
        NSLog(@"%@",error);
    }];
    
  

}


-(void)loadBody{

//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"zhu"];


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 29;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
cell.textLabel.text = @"zhuzhuhuz";
    return cell;

}







@end

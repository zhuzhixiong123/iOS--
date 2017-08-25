//
//  ZXYiZhuController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXYiZhuController.h"

@interface ZXYiZhuController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

@end

@implementation ZXYiZhuController

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    
    [self initTableView];
}

-(void)initTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"zhu"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
    //创建tableHeader
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 38)];
    headView.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"长期",@"短期"]];
    control.frame = CGRectMake(30, 5, Screen_W - 60, headView.height - 10);
    control.selectedSegmentIndex = 0;
    control.tintColor = mainColor;
    [control addTarget:self action:@selector(choiceClick:) forControlEvents:UIControlEventValueChanged];
    [headView addSubview:control];
    self.tableView.tableHeaderView = headView;
    
    
    
}

-(void)choiceClick:(UISegmentedControl*)sender{

    NSLog(@"%ld",sender.selectedSegmentIndex);

}

-(void)loadData{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
  
    
    NSString *string = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/longTermDoctorNote/page/1/pageSize/10",self.bianHaoID];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.textLabel.text = @"zhuzhuhzu";
    return cell;

}


@end

//
//  ZXJianChaDetailController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/29.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXJianChaDetailController.h"

#import "ZXJianChaDetailCell.h"
#import "ZXJianChaDetailModel.h"
@interface ZXJianChaDetailController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArray;

@end

@implementation ZXJianChaDetailController

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 57;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpVc];
    [self loadData];
    
    
}

-(void)setUpVc{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"检查详情";
    
    [self.tableView registerClass:[ZXJianChaDetailCell class] forCellReuseIdentifier:@"zhu"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

-(void)loadData{

    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *string = [NSString stringWithFormat:@"%@%@",baseUrl,self.detailUrl];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"++**++%@",responseObject);
        [SVProgressHUD dismiss];
        
        self.dataArray = [ZXJianChaDetailModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [SVProgressHUD dismiss];
        NSLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXJianChaDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    return cell;
}












@end

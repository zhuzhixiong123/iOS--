//
//  ZXJianChaController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXJianChaController.h"
#import "ZXJianChaCell.h"
#import "ZXJianChaModel.h"
@interface ZXJianChaController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ZXJianChaController
{
    //page值用于上拉刷新
    NSInteger _page;
}


-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64 + 120 + 44, 0);
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableView];
    [self loadData];
}

-(void)initTableView{
    [self.tableView registerClass:[ZXJianChaCell class] forCellReuseIdentifier:@"zhu"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    //上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDate)];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];

}

-(void)loadNewDate{
    [self.tableView.mj_header endRefreshing];
    
}

-(void)loadMoreDate{
    
    _page += 1;
    
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *tempString = @"2014-03-01%2011:14:00";
    NSString *urlString  = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/examResult/%@/page/%ld/pageSize/10",self.bianHaoID,tempString,_page] ;
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [maneger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"****%@---%ld",responseObject[@"totalPages"],_page);
        
        if ( [responseObject[@"totalPages"] integerValue] <= _page) {
            [SVProgressHUD showInfoWithStatus:@"没有数据"];
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
        NSArray *arrM = [ZXJianChaModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        [self.dataArray addObjectsFromArray:arrM];
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}


-(void)loadData{
    
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *tempString = @"2014-03-01%2011:14:00";
    NSString *string = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/examResult/%@/page/0/pageSize/10",self.bianHaoID,tempString];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
        
        NSLog(@"****%@---%ld",responseObject[@"totalPages"],_page);
        NSArray *array = responseObject[@"result"];
        self.dataArray = [ZXJianChaModel mj_objectArrayWithKeyValuesArray:array];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXJianChaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXJianChaModel *model = self.dataArray[indexPath.row];
    CGFloat cellH = [[NSString alloc] heightWithText:model.sampleName andFont:12 andWidth:Screen_W - 24];
    return cellH + 36;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 松开手选中颜色消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;
}

@end


















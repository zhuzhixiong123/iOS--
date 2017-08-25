//
//  ZXKeShiSickController.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXKeShiSickController.h"
#import "ZXKeShiListModel.h"
#import "ZXKeShiListCell.h"
#import "ZXKeShiDetailController.h"

@interface ZXKeShiSickController ()<UITableViewDelegate,UITableViewDataSource>

//保存病人列表
@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,weak) UITableView *tableView;

//保存上个控制器传的zidain
@property(nonatomic,strong) NSDictionary *dictPass;


@end

@implementation ZXKeShiSickController
{
//page值用于上拉刷新
    NSInteger _page;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 90;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

-(NSArray *)NSMutableArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noteClick:) name:@"keshi_click" object:nil];
}

-(void)loadNewDate{
        [self.tableView.mj_header endRefreshing];
}

-(void)loadMoreDate{
    _page += 1;
    
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *urlString = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/department/%@/page/%ld/pageSize/10",self.dictPass[@"departmentId"],_page];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    
    [maneger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@  %ld",responseObject[@"totalPages"],_page);
        
        if ( [responseObject[@"totalPages"] integerValue] <= _page) {
            [SVProgressHUD showInfoWithStatus:@"没有数据"];
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
        
        NSArray *array = [ZXKeShiListModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

-(void)noteClick:(NSNotification *)note{
    _page = 0;
    self.dictPass = note.userInfo;
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *urlString = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/department/%@/page/%ld/pageSize/10",self.dictPass[@"departmentId"],_page];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    
    [SVProgressHUD showWithStatus:@"数据加载..."];
  
    [maneger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        self.dataArray = [ZXKeShiListModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        
        [self initTableview];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [SVProgressHUD dismiss];
         [SVProgressHUD showErrorWithStatus:@"请检查网络"];
    }];
}

-(void)initTableview{
    [self.tableView registerClass:[ZXKeShiListCell class] forCellReuseIdentifier:@"zhu"];
    [self.tableView reloadData];
    
    
    //创建tableHeader
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 38)];
    headView.backgroundColor = [UIColor whiteColor];

    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"全部",@"新入院",@"危重"]];
    control.frame = CGRectMake(30, 5, Screen_W - 60, headView.height - 10);
    control.selectedSegmentIndex = 0;
    control.tintColor = mainColor;
    [control addTarget:self action:@selector(choiceClick:) forControlEvents:UIControlEventValueChanged];
    [headView addSubview:control];
    self.tableView.tableHeaderView = headView;
    
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    //上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDate)];
}

-(void)choiceClick:(UISegmentedControl*)control{
    
    if (control.selectedSegmentIndex == 0) {
        NSLog(@"00000000");
    }
    
    if (control.selectedSegmentIndex == 1) {
        NSLog(@"11111111");
    }
    
    
    if (control.selectedSegmentIndex == 2) {
        NSLog(@"22222222");
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXKeShiListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 松开手选中颜色消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 2
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;

    ZXKeShiListModel *model = self.dataArray[indexPath.row];
    ZXKeShiDetailController *vc = [[ZXKeShiDetailController alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
    
}






@end

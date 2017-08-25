//
//  ZXYiZhuController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXYiZhuController.h"
#import "ZXYiZhuModel.h"
#import "ZXYiZhuCell.h"

@interface ZXYiZhuController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;

//@property(nonatomic,assign) ;;

@end

@implementation ZXYiZhuController
{
    //page值用于上拉刷新
    NSInteger _page;
    //用于切换短期和长期
    NSString *_timeString;
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
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64 + 120 + 44, 0);
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 72;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _timeString = @"longTermDoctorNote";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    
    [self initTableView];
    _page = 0;
 
}

-(void)initTableView{
    [self.tableView registerClass:[ZXYiZhuCell class] forCellReuseIdentifier:@"zhu"];
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
    NSString *urlString  = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/%@/page/%ld/pageSize/10",self.bianHaoID,_timeString,_page];;
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [maneger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"****%@---%ld",responseObject[@"totalPages"],_page);
        
        if ( [responseObject[@"totalPages"] integerValue] <= _page) {
            [SVProgressHUD showInfoWithStatus:@"没有数据"];
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
        
        NSArray *array = responseObject[@"result"];
        NSMutableArray *arrM  = [NSMutableArray array];
        for (NSArray *tempArr in array) {
            
            for (NSDictionary *dict in tempArr) {
                ZXYiZhuModel *model = [ZXYiZhuModel mj_objectWithKeyValues:dict];
                [arrM addObject:model];
            }
        }
  
        [self.dataArray addObjectsFromArray:arrM];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}


-(void)choiceClick:(UISegmentedControl*)sender{
    
    if (sender.selectedSegmentIndex == 1) {
        _timeString = @"shortTermDoctorNote";
        
        [self loadData];
        _page = 0;
    }
    
    if (sender.selectedSegmentIndex == 0) {
          _timeString = @"longTermDoctorNote";
        
        [self loadData];
        _page = 0;
    }
}

-(void)loadData{
    
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];

    NSString *string = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/%@/page/0/pageSize/10",self.bianHaoID,_timeString];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];

        NSArray *array = responseObject[@"result"];
        NSMutableArray *arrM  = [NSMutableArray array];
        for (NSArray *tempArr in array) {
            
            for (NSDictionary *dict in tempArr) {
                ZXYiZhuModel *model = [ZXYiZhuModel mj_objectWithKeyValues:dict];
                [arrM addObject:model];
            }
        }
        self.dataArray = arrM;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXYiZhuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;

}

@end

//
//  ZXBingChengController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXBingChengController.h"
#import "ZXBingChengCell.h"

#import "ZXBingChengModel.h"

@interface ZXBingChengController ()<UITableViewDelegate,UITableViewDataSource,ZXBingChengCellDelegate>

@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) ZXBingChengModel *model;

@end

@implementation ZXBingChengController


-(NSArray *)dataArray{
    if (_dataArray  == nil) {
        _dataArray = [NSArray array];
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
    [self loadData];
    
    [self initTableView];
    
}

-(void)initTableView{
    [self.tableView registerClass:[ZXBingChengCell class] forCellReuseIdentifier:@"zhu"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    
}

-(void)loadNewDate{
    [self.tableView.mj_header endRefreshing];
}

-(void)loadData{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *tempString = @"2014-06-10%2008:20:00";
    
    NSString *string = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/otherProgressRecords/%@/page/0/pageSize/10",self.bianHaoID,tempString];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
        self.dataArray = responseObject[@"result"];
        
        NSArray *keys = @[@"titleL",@"contL",@"bottomL"];
        NSMutableArray *arrM = [NSMutableArray array];
        for (int a = 0; a < self.dataArray.count; a++) {
            NSDictionary *dict = [NSDictionary dictionaryWithObjects:self.dataArray[a] forKeys:keys];
            
            [arrM addObject:dict];
        }
       
        self.dataArray = [ZXBingChengModel mj_objectArrayWithKeyValuesArray:arrM];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXBingChengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    cell.delegate = self;
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXBingChengModel *model = self.dataArray[indexPath.row];
    if (model.isShowMoreText){
        return [ZXBingChengCell moreHeight:model];
    } else{
        return 118;
    }
}

-(void)bingChengCellClickByCell:(UITableViewCell *)cell{
    NSIndexPath *indexs = [self.tableView indexPathForCell:cell];
    [self.tableView reloadRowsAtIndexPaths:@[indexs] withRowAnimation:UITableViewRowAnimationAutomatic];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ZXBingChengModel *model = self.dataArray[indexPath.row];
    model.isShowMoreText = !model.isShowMoreText;
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



@end

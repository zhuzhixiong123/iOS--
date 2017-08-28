//
//  ZXFirstBCController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/28.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXFirstBCController.h"

#import "ZXFirstCell.h"
#import "ZXFirstModel.h"

@interface ZXFirstBCController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@end

@implementation ZXFirstBCController

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
    self.navigationItem.title = @"首次病程记录";
    
    [self.tableView registerClass:[ZXFirstCell class] forCellReuseIdentifier:@"zhu"];
}

-(void)loadData{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *tempString = @"2014-06-10%2008:20:00";
    
    NSString *string = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/patient/%@/firstProgressRecord/%@",self.bianHaoID,tempString];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSArray *titleS = responseObject[@"content"];
        
        NSString *keys = @"titles";
        
        NSMutableArray *arrM = [NSMutableArray array];
        for (int a = 0; a < titleS.count; a++) {
            NSDictionary *dict = [NSDictionary dictionaryWithObject:titleS[a] forKey:keys];
            
            ZXFirstModel *model = [ZXFirstModel modelWithDict:dict];
            [arrM addObject:model];
        }
    
        self.dataArray = arrM;
        NSLog(@"***%@",arrM);
        [self.tableView reloadData];
     
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZXFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZXFirstModel *model = self.dataArray[indexPath.row];
    CGFloat height = [[NSString alloc] heightWithText:model.titles andFont:12 andWidth:Screen_W - 24];
    return height + 10;

}

@end

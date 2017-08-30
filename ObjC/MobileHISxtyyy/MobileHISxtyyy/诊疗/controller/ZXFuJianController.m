//
//  ZXFuJianController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXFuJianController.h"
#import "ZXFuJianModel.h"

#import "ZXFuJianDetailController.h"

@interface ZXFuJianController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;

@end
@implementation ZXFuJianController

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
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    
   
}

-(void)initTableView{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"zhu"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 36)];
    self.tableView.tableHeaderView = headView;
    
    
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(15, (headView.height - 15) * 0.5, 100, 15)];
    lable.text = @"超生报告";
    lable.font = [UIFont boldSystemFontOfSize:14];
    [headView addSubview:lable];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, headView.height - 1, Screen_W - 12, 1)];
    line.backgroundColor = RGBACOLOR(223, 223, 223, 1.0);
    [headView addSubview:line];
}

-(void)loadData{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *string = [NSString stringWithFormat:@"%@/patient/%@/BCHistory/page/0/pageSize/10",baseUrl,self.bianHaoID];
    
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    NSLog(@"%@",string);
    
    [maneger GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.dataArray = [ZXFuJianModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        
         [self initTableView];
        
//        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  ZXFuJianModel *model = self.dataArray[indexPath.row];
    NSString *timeS = [[NSString alloc] timeWithTimeIntervalString:model.reportTime];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@   %@",timeS,model.ultraSoundPart];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 松开手选中颜色消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;
    
    ZXFuJianModel *model = self.dataArray[indexPath.row];
    ZXFuJianDetailController *detail = [[ZXFuJianDetailController alloc] init];
    detail.model = model;
    [self.navigationController pushViewController:detail animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZXFuJianModel *model = self.dataArray[indexPath.row];
    NSString *timeS = [[NSString alloc] timeWithTimeIntervalString:model.reportTime];
    
    NSString *cellString = [NSString stringWithFormat:@"%@   %@",timeS,model.ultraSoundPart];
    
    CGFloat height = [[NSString alloc] heightWithText:cellString andFont:13 andWidth:Screen_W - 30];
    
    return height + 20;
}








@end

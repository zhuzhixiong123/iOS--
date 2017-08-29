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
#import "ZXFirstBCController.h"

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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 32)];
    [headView addGestureRecognizer:tap];
    headView.backgroundColor = RGBACOLOR(230, 230, 230, 1.0);
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(12, 9, 200, 16)];
    lable.text = @"首次病程记录";
    lable.font = [UIFont systemFontOfSize:13];
    [headView addSubview:lable];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(Screen_W - 26, (headView.height - 14) * 0.5, 14, 14)];
    imageView.image = [UIImage imageNamed:@"caret_right"];
    [headView addSubview:imageView];
    
    self.tableView.tableHeaderView = headView;
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
}

-(void)tapClick{
    NSLog(@"zhu");
    ZXFirstBCController *vc = [[ZXFirstBCController alloc] init];
    vc.bianHaoID = self.bianHaoID;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)loadNewDate{
    [self.tableView.mj_header endRefreshing];
}

-(void)loadData{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *tempString = @"2014-06-10%2008:20:00";
    
    NSString *string = [NSString stringWithFormat:@"%@/patient/%@/otherProgressRecords/%@/page/0/pageSize/10",baseUrl,self.bianHaoID,tempString];
    
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
    // 1 松开手选中颜色消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;
    
    ZXBingChengModel *model = self.dataArray[indexPath.row];
    model.isShowMoreText = !model.isShowMoreText;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



@end

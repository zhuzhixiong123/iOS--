//
//  ZXRuYuanController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXRuYuanController.h"
#import "ZXRuYuanCell.h"
@interface ZXRuYuanController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

@property(nonatomic,strong) NSArray *titleS;
@property(nonatomic,strong) NSArray *contLableS;

@end

@implementation ZXRuYuanController

-(NSArray *)contLableS{
    if (_contLableS == nil) {
        _contLableS = [NSArray array];
    }
    return _contLableS;
}

-(NSArray *)titleS{
    if (_titleS == nil) {
        _titleS = [NSArray array];
    }
    return _titleS;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        [self.view addSubview:tableView];
        tableView.rowHeight = 88;
//        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64 + 120 + 44, 0);
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
   
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
        NSDictionary *mainDict = dict[@"content"];
        
        self.titleS = [mainDict allKeys];
        self.contLableS = [mainDict allValues];
    
        [self.tableView registerClass:[ZXRuYuanCell class] forCellReuseIdentifier:@"zhu"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           [SVProgressHUD dismiss];
        NSLog(@"%@",error);
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleS.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXRuYuanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    
    cell.titles.text = self.titleS[indexPath.row];
    cell.contLable.text = self.contLableS[indexPath.row];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = self.contLableS[indexPath.row];
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGSize maxSize = CGSizeMake(Screen_W - 2 * 12, MAXFLOAT);

    CGSize text_size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return text_size.height + 38 ;

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

//
//  ZXYIZhuDetailController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXYIZhuDetailController.h"
#import "ZXYiZhuModel.h"
#import "ZXYIZhuDetailCell.h"


@interface ZXYIZhuDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray *dataArray;
@property(nonatomic,strong) NSArray *contArray;
@property(nonatomic,weak) UITableView *tableView;

@end

@implementation ZXYIZhuDetailController

-(NSArray *)contArray{
    if (_contArray == nil) {
        _contArray = @[self.model.title,self.model.startTime,self.model.dose,self.model.quantity,self.model.unitPrice,self.model.submittedBy,self.model.executedDepartment,@""];
    }
    return _contArray;
}
-(NSArray *)dataArray{
    if (_dataArray == nil) {
         _dataArray = @[@"医嘱项目",@"开始时间",@"结束时间",@"样本类型",@"剂量",@"数量",@"频次",@"ww"];
    
      }
    return _dataArray;
}


-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 25;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBody];
}


-(void)loadBody{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"医嘱详情";
    
    [self.tableView registerClass:[ZXYIZhuDetailCell class] forCellReuseIdentifier:@"zhu"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZXYIZhuDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.titleL.text = self.dataArray[indexPath.row];
    cell.vulueL.text = self.contArray[indexPath.row];
    return cell;

}



@end

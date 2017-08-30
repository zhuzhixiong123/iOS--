//
//  ZXFuJianDetailController.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/30.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXFuJianDetailController.h"
#import "ZXFuJianModel.h"
#import "ZXFuJianDetailCell.h"

@interface ZXFuJianDetailController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArray;

@end

@implementation ZXFuJianDetailController

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        NSString *time = [[NSString alloc] timeWithTimeIntervalString:self.model.reportTime];
        
        NSDictionary *dict_1 = @{
                               @"title" : @"部位",
                               @"contView" : self.model.ultraSoundPart
                               };
        
        NSDictionary *dict_2 = @{
                               @"title" : @"报告医生",
                               @"contView" : self.model.reportDoctor
                               };
        
        NSDictionary *dict_3 = @{
                                 @"title" : @"报告时间",
                                 @"contView" : time
                                 };
        
        NSDictionary *dict_4 = @{
                                 @"title" : @"检查所见",
                                 @"contView" : self.model.resultDescription
                                 };
        
        NSDictionary *dict_5 = @{
                                 @"title" : @"检查提示",
                                 @"contView" : self.model.doctorComment
                                 };
        
        _dataArray = @[dict_1,dict_2,dict_3,dict_4,dict_5];
    }
    return _dataArray;
}


-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
//        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpVc];
    
    [self initTableView];
    
    NSLog(@"******%@",self.dataArray);
}

-(void)setUpVc{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"复检详情";

}

-(void)initTableView{

    [self.tableView registerClass:[ZXFuJianDetailCell class] forCellReuseIdentifier:@"zhu"];
    
    UIView *bottView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 120)];
    bottView.backgroundColor = HMColor;
    self.tableView.tableFooterView = bottView;
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, 100, 16)];
    lable.font = [UIFont systemFontOfSize:13];
    lable.text = @"B超图片";
    [bottView addSubview:lable];
    
    int totalColumns = 3;
    NSArray *array = self.model.images;

    CGFloat iamge_M = 10;
    CGFloat cellW = (Screen_W - iamge_M * 4) / totalColumns;
    CGFloat cellH = cellW;
    //    根据格子个数创建对应的框框
    for(int index = 0; index< array.count; index++) {
        UIImageView *cellView = [[UIImageView alloc] init];
        // 计算行号  和   列号
        int row = index / totalColumns;
        int col = index % totalColumns;
        //根据行号和列号来确定 子控件的坐标
        CGFloat cellX = iamge_M + col * (cellW + iamge_M);
        CGFloat cellY = row * (cellH + 12) + 33;
        cellView.frame = CGRectMake(cellX, cellY, cellW, cellH);
        
        NSDictionary *dict = array[index];
        NSString *urlString = [NSString stringWithFormat:@"%@%@",baseUrl,dict[@"imageUrl"]];
        
        [cellView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        // 添加到view 中  
        [bottView addSubview:cellView];
    }
    NSInteger page = 0;
    if (array.count % totalColumns > 0) {
        page = 1;
    }
    
    bottView.frame = CGRectMake(0, 0, 0, (array.count / totalColumns + page) * (cellH + 12) + 36);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.dataArray[indexPath.row];
    ZXFuJianDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu" forIndexPath:indexPath];
    cell.titleL.text = dict[@"title"];
    cell.contL.text = dict[@"contView"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//     1 松开手选中颜色消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // 3点击没有颜色改变
    cell.selected = NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.dataArray[indexPath.row];
    CGFloat height = [[NSString alloc] heightWithText:dict[@"contView"] andFont:13 andWidth:Screen_W - 24];
    return height + 36;
}



@end

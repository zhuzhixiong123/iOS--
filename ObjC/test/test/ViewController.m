//
//  ViewController.m
//  test
//  Created by 志雄 朱 on 2017/8/3.
//  Copyright © 2017年 志雄 朱. All rights reserved.

#import "ViewController.h"
#import "UIView+SDAutoLayout.h"

<<<<<<< Updated upstream
#import "testCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak) UITableView *tableView;

//数据
@property(nonatomic,strong) NSArray *dataArray;

=======
@interface ViewController ()
@property(nonatomic,weak)  UIView *views;
>>>>>>> Stashed changes
@end

@implementation ViewController

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = @[@"ddddddd",@"yyyyyyyy",@"rrrrrrrr",@"cccccccc",@"bbbbbbbb",@"nnnnnnnnn",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee",@"eeeeeeeee"];
    }
    return _dataArray;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 99;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< Updated upstream
    [self.tableView registerClass:[testCell class] forCellReuseIdentifier:@"zhu"];
    
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    head.backgroundColor = [UIColor whiteColor];
    
    UIView *view_1 = [[UIView alloc] initWithFrame:CGRectMake(12, 12, self.view.bounds.size.width * 0.5 - 24, head.bounds.size.height - 20)];
    view_1.backgroundColor = [UIColor lightGrayColor];
    view_1.layer.cornerRadius = 5;
    [head addSubview:view_1];
    
=======

    [self loadBody];
>>>>>>> Stashed changes
    
    UIView *view_2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0.5 + 12, 12, self.view.bounds.size.width * 0.5 - 24, head.bounds.size.height - 20)];
     view_2.layer.cornerRadius = 5;
    view_2.backgroundColor = [UIColor lightGrayColor];
    [head addSubview:view_2];
    
    
    self.tableView.tableHeaderView = head;
    
    
    self.navigationItem.title = @"test";
}

<<<<<<< Updated upstream
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    testCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhu"];
    return cell;
}
=======
-(void)loadBody{
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"蝰蛇音效",@"均衡器",nil];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(50, 60, self.view.bounds.size.width - 100, 30);
    [self.view addSubview:segmentedControl];
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
    
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, 600)];
    self.views = views;
    views.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:views];
    
}

-(void)segChange:(UISegmentedControl*)sender{

    NSLog(@"%ld",sender.selectedSegmentIndex);
    
    if (sender.selectedSegmentIndex == 0) {
        
        self.views.hidden = NO;
        
        
    }
    
    
    if (sender.selectedSegmentIndex == 1) {
        
        self.views.hidden = YES;
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 300, 30)];
        
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setText:@"zhuzhuz"];
        [self.view addSubview:lable];
        
        
    }


}



















-(void)test{
>>>>>>> Stashed changes

-(void)test{
    UIView *head = [[UIView alloc] init];
    head.backgroundColor = [UIColor redColor];
    [self.view addSubview:head];

    head.sd_layout
    .leftSpaceToView(self.view,20)
    .rightSpaceToView(self.view,20)
    .topSpaceToView(self.view,100)
    .heightIs(100);
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 [tableView deselectRowAtIndexPath:indexPath animated:NO];
  
    NSLog(@"zhu--%ld",indexPath.row);

}











































@end

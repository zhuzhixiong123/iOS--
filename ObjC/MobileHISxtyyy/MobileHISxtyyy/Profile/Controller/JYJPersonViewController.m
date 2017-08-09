//
//  JYJPersonViewController.m
//  导航测试demo
//
//  Created by JYJ on 2017/6/5.
//  Copyright © 2017年 baobeikeji. All rights reserved.
//

#import "JYJPersonViewController.h"
#import "testController.h"
#import "JYJCommenItem.h"
#import "JYJProfileCell.h"

@interface JYJPersonViewController () <UITableViewDelegate, UITableViewDataSource>
/** tableView */
@property (nonatomic, weak) UITableView *tableView;
/** headerIcon */
@property (nonatomic, weak) UIImageView *headerIcon;
/** data */
@property (nonatomic, strong) NSArray *data;
@end

@implementation JYJPersonViewController

- (NSArray *)data {
    if (!_data) {
        self.data = [NSArray array];
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    [self setupData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.frame = self.view.bounds;
    self.headerIcon.frame = CGRectMake(self.tableView.frame.size.width / 2 - 33, 88, 66, 66);
}

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] init];
    tableView.scrollEnabled = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
   
    self.tableView = tableView;
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.frame = CGRectMake(0, 0, 0, 200);
    self.tableView.tableHeaderView = headerView;
    
    /** 头像图片 */
    UIImageView *headerIcon = [[UIImageView alloc] init];
    headerIcon.backgroundColor = [UIColor grayColor];
    headerIcon.frame = CGRectMake(0, 0, 72, 72);
    headerIcon.layer.cornerRadius = 33;
    headerIcon.clipsToBounds = YES;
    [headerView addSubview:headerIcon];
    self.headerIcon = headerIcon;
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, Screen_H - 80, 100, 30)];
    [btn setTitle:@"退出登陆" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(exitClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [tableView addSubview:btn];
    
}


-(void)exitClick{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"退出登陆" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];

}


- (void)setupData {
    JYJCommenItem *myWallet = [JYJCommenItem itemWithIcon:@"menu_wallet" title:@"班表" subtitle:@""];
    
    JYJCommenItem *myCoupon = [JYJCommenItem itemWithIcon:@"menu_promo" title:@"文章" subtitle:@""];
    
    JYJCommenItem *myTrip = [JYJCommenItem itemWithIcon:@"menu_trips" title:@"收藏" subtitle:nil];
    
    JYJCommenItem *myFriend = [JYJCommenItem itemWithIcon:@"menu_invite" title:@"设置" subtitle:nil];
    
    self.data = @[myWallet, myCoupon, myTrip, myFriend];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    JYJProfileCell *cell = [JYJProfileCell cellWithTableView:tableView];
    cell.item = self.data[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        testController *vc = [[testController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
}



@end

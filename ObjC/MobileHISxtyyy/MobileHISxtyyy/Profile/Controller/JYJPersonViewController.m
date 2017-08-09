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
    self.headerIcon.frame = CGRectMake(self.tableView.frame.size.width / 2 - 36, 39, 72, 72);
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
    headerView.backgroundColor = RGBACOLOR(223, 223, 223, 1.0);
    headerView.frame = CGRectMake(0, 0, 0, 150);
    self.tableView.tableHeaderView = headerView;
    
    /** 头像图片 */
    UIImageView *headerIcon = [[UIImageView alloc] init];
    headerIcon.backgroundColor = [UIColor grayColor];
    headerIcon.frame = CGRectMake(0, 39, 72, 72);
    headerIcon.layer.cornerRadius = 36;
    headerIcon.clipsToBounds = YES;
    [headerView addSubview:headerIcon];
    self.headerIcon = headerIcon;
}


- (void)setupData {
    JYJCommenItem *myWallet = [JYJCommenItem itemWithIcon:@"menu_wallet" title:@"我的钱包" subtitle:@""];
    
    JYJCommenItem *myCoupon = [JYJCommenItem itemWithIcon:@"menu_promo" title:@"我的卡券" subtitle:@""];
    
    JYJCommenItem *myTrip = [JYJCommenItem itemWithIcon:@"menu_trips" title:@"我的行程" subtitle:nil];
    
    JYJCommenItem *myFriend = [JYJCommenItem itemWithIcon:@"menu_invite" title:@"邀请好友" subtitle:nil];
    
    JYJCommenItem *mySticker = [JYJCommenItem itemWithIcon:@"menu_sticker" title:@"我的贴纸" subtitle:nil];
    self.data = @[myWallet, myCoupon, myTrip, myFriend, mySticker];
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
    
    testController *vc = [[testController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    

}



@end

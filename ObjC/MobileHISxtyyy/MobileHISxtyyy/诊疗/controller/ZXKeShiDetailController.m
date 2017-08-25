//
//  ZXKeShiDetailController.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/27.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXKeShiDetailController.h"
#import "ZXRuYuanController.h"
#import "ZXBingChengController.h"
#import "ZXYiZhuController.h"
#import "ZXJianChaController.h"
#import "ZXFuJianController.h"

#import "ZXKeShidetaiView.h"
#import "ZXKeShiListModel.h"

@interface ZXKeShiDetailController ()<UIScrollViewDelegate>

@property(nonatomic,weak) UIView *headView;
@property(nonatomic,strong) NSArray *titileS;

//记录点击的按钮
@property(nonatomic,weak)UIButton *clickedBtn;

//内容视图
@property(nonatomic,weak) UIScrollView *scrollview;

@property(nonatomic,strong) NSMutableArray *btns;

@property(nonatomic,weak) UIView *titleView;

@end

@implementation ZXKeShiDetailController

-(NSMutableArray *)btns{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

-(NSArray *)titileS{
    if (_titileS == nil) {
        _titileS  = @[@"入院",@"病程",@"医嘱",@"检查",@"辅检"];
    }
    return _titileS;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpVc];
    [self loadHeadView];
    [self loadContView];
    [self addchildViewController];
    
    
    UIButton *btn = self.btns[0];
    [self btnClick:btn];
}

-(void)setUpVc{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"详细信息";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
}



-(void)loadHeadView{
    ZXKeShidetaiView *headView = [[ZXKeShidetaiView alloc] initWithFrame:CGRectMake(0, 64, Screen_H, 120)];
    self.headView = headView;
    headView.disName.text = self.model.name;
    headView.bedNo.text = self.model.bedNumber;
    headView.docName.text = self.model.doctorName;
    headView.sexValue.text = self.model.gender;
    headView.zhuYuanNo.text = self.model.hospitalId;
    headView.ageValue.text = self.model.age;
    headView.ruYuanData.text = self.model.admissionDate;
    headView.diseaseName.text = self.model.diagnosis;
    headView.xingZhiDet.text = self.model.type;
    headView.huLiDet.text = self.model.nursingLevel;
    [self.view addSubview:headView];
    
}

-(void)loadContView{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), Screen_W, 44)];
    self.titleView = titleView;
    [titleView setBackgroundColor:HMColor];
    [self.view addSubview:titleView];
    
    //创建所有按钮
    CGFloat btn_w = Screen_W / 5;
    CGFloat btn_h = 21;
    for (NSInteger num = 0; num < self.titileS.count; num++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btn_w * num, (titleView.height - btn_h) * 0.5, btn_w, btn_h);
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [btn setTitle:self.titileS[num] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = num;
        
        [self.btns addObject:btn];
        [titleView addSubview:btn];
        
    }
    
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), Screen_W, Screen_H - CGRectGetMaxY(titleView.frame))];
    scrollview.delegate = self;
    self.scrollview = scrollview;
    scrollview.pagingEnabled = YES;
    scrollview.bounces = NO;
    [self.view addSubview:scrollview];
    scrollview.contentSize = CGSizeMake(Screen_W * 5, 0);
    
}


-(void)btnClick:(UIButton*)btn{
    //改变按钮的颜色
    [self btnChangeColor:btn];
    //改变contScollview的内容
    [self contChange: btn.tag];
    //设置偏移量
    self.scrollview.contentOffset = CGPointMake(Screen_W *  btn.tag, 0);
}

//按钮的颜色变化
-(void)btnChangeColor:(UIButton*)btn{
    _clickedBtn.transform = CGAffineTransformIdentity;
    [_clickedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:mainColor forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    _clickedBtn = btn;
    
}

//contScollview内容的变化
-(void)contChange:(NSInteger)i{
    UIViewController *vc = self.childViewControllers[i];
    vc.view.frame = CGRectMake(Screen_W * i, 0, Screen_W, self.scrollview.height);
    [self.scrollview addSubview:vc.view];
}

//UIscollview的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger i = scrollView.contentOffset.x / Screen_W;
    //从按钮数组中取按钮
    UIButton *btn =  self.btns[i];
    //改变title文字
    [self btnChangeColor:btn];
    //改变contScollview内容
    [self contChange:i];
    
//    CGRect titleFrame = self.titleView.frame;
//    titleFrame.origin.y = 64;
//    self.titleView.frame = titleFrame;
  
//    CGRect scrollFrame = self.scrollview.frame;
//    scrollFrame.origin.y = 64 + 44;
//    scrollFrame.size.height  = Screen_H - 64 - 44;
//    self.scrollview.frame = scrollFrame;
}

#pragma mark-----------添加子控制器
-(void)addchildViewController{
    
    ZXRuYuanController *q1 = [[ZXRuYuanController alloc]init];
    q1.bianHaoID = self.model.hospitalId;
    [self addChildViewController:q1];
    
    ZXBingChengController *w3 = [[ZXBingChengController alloc]init];
    w3.bianHaoID = self.model.hospitalId;
    [self addChildViewController:w3];
    
    ZXYiZhuController *w4 = [[ZXYiZhuController alloc]init];
    w4.bianHaoID = self.model.hospitalId;
    [self addChildViewController:w4];
    
    ZXJianChaController *w5 = [[ZXJianChaController alloc]init];
    w5.bianHaoID = self.model.hospitalId;
    [self addChildViewController:w5];
    
    ZXFuJianController *w6 = [[ZXFuJianController alloc]init];
    [self addChildViewController:w6];
    
}
















@end

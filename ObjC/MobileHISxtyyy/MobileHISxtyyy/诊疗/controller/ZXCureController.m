//
//  ZXCureController.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXCureController.h"
#import "ZXKeShiSickController.h"
#import "ZXKeShiWeiJiController.h"
#import "DLPickerView.h"
#import "ZXKeShiModel.h"

#import "FKGPopOption.h"


#import "JYJSliderMenuTool.h"

@interface ZXCureController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong) NSArray *titleS;

//记录选中的btn
@property(nonatomic,weak) UIButton *selbtn;

//保存所有的按钮
@property(nonatomic,strong) NSArray *btnArray;

@property(nonatomic,weak) UIView *line;

//内容视图
@property(nonatomic,weak) UIScrollView *scrollview;

@property(nonatomic,weak) ZXKeShiSickController *sickVc;
@property(nonatomic,weak) ZXKeShiWeiJiController *weiJiVc;

//保存科室里的信息
@property(nonatomic,strong) ZXKeShiModel *KeshiModel;

//保存科室的数组
@property(nonatomic,strong) NSArray *keshiS;

/** tapGestureRec */
@property (nonatomic, weak) UITapGestureRecognizer *tapGestureRec;
/** panGestureRec */
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRec;


@end

@implementation ZXCureController

-(NSArray *)keshiS{
    if (_keshiS == nil) {
        _keshiS = [NSArray array];
    }
    return _keshiS;
}


-(NSArray *)btnArray{
    if (_btnArray == nil) {
        _btnArray = [NSArray array];
    }
    return _btnArray;
}


-(ZXKeShiWeiJiController *)weiJiVc{
    if (_weiJiVc == nil) {
        ZXKeShiWeiJiController *weiJiVc = [[ZXKeShiWeiJiController alloc] init];
        weiJiVc.view.frame = CGRectMake(Screen_W, 0, Screen_W, self.scrollview.height);
        [self addChildViewController:weiJiVc];
        [self.scrollview addSubview:weiJiVc.view];
        _weiJiVc = weiJiVc;
    }
    return _weiJiVc;
}

-(ZXKeShiSickController *)sickVc{
    if (_sickVc == nil) {
        
        ZXKeShiSickController *sickVc = [[ZXKeShiSickController alloc] init];
        sickVc.view.frame = CGRectMake(0, 0, Screen_W, self.scrollview.height);
        [self addChildViewController:sickVc];
        [self.scrollview addSubview:sickVc.view];
        _sickVc = sickVc;
    }

    return _sickVc;
}

-(UIScrollView *)scrollview{
    if (_scrollview == nil) {
        UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.line.frame), Screen_W, Screen_H - CGRectGetMaxY(self.line.frame) - 49)];
        scrollview.backgroundColor = [UIColor lightGrayColor];
        scrollview.delegate = self;
        scrollview.bounces = NO;
        scrollview.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:scrollview];
        scrollview.pagingEnabled = YES;
        _scrollview = scrollview;
    }
    return _scrollview;
}


-(NSArray *)titleS{
    if (_titleS == nil) {
        _titleS = @[@"科室病人",@"科室危急值"];
    }
    return _titleS;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpVc];
    [self loadBody];

}

-(void)setUpVc{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的病人";
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem backItemWithImageName:@"" andHighName:@"" target:self action:@selector(rightClick:) andTitle:@"选科室"];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImageName:@"" andHighName:@"" target:self action:@selector(leftClick) andTitle:@"侧滑"];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 这个方法是为了，不让隐藏状态栏的时候出现view上移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 屏幕边缘pan手势(优先级高于其他手势)
    UIScreenEdgePanGestureRecognizer *leftEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
                                                                                                          action:@selector(moveViewWithGesture:)];
    leftEdgeGesture.edges = UIRectEdgeLeft;// 屏幕左侧边缘响应
    [self.view addGestureRecognizer:leftEdgeGesture];
    // 这里是地图处理方式，遵守代理协议，实现代理方法
    leftEdgeGesture.delegate = self;
    

}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    BOOL result = NO;
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        result = YES;
    }
    return result;
}


- (void)moveViewWithGesture:(UIPanGestureRecognizer *)panGes {
    if (panGes.state == UIGestureRecognizerStateEnded) {
        [self leftClick];
    }
}

-(void)leftClick{
    // 展示个人中心
    [JYJSliderMenuTool showWithRootViewController:self];
}

-(void)rightClick:(UIButton*)optionButton{
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
    NSString *username = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    NSString *urlString = [NSString stringWithFormat:@"http://222.243.168.34:1111/Dev_MobileHIS/user/%@/imei/111",username];
 
    NSString *headers = [[NSString alloc] getHttpHeadParts];
    
    [maneger.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", headers] forHTTPHeaderField:@"Authorization"];
    [SVProgressHUD showWithStatus:@"加载数据..."];
    [maneger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
   self.KeshiModel = [ZXKeShiModel mj_objectWithKeyValues:responseObject];
        
        self.keshiS = responseObject[@"accessibleDepartments"];
        
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in self.keshiS) {
                NSString *string = dict[@"name"];
        
                [arrM addObject:string];
        
            }
            [arrM insertObject:@"我的科室" atIndex:0];
        
        // 注意：由convertRect: toView 获取到屏幕上该控件的绝对位置。
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
         CGRect frame = [optionButton convertRect:optionButton.bounds toView:window];
        
        FKGPopOption *s = [[FKGPopOption alloc] initWithFrame:self.view.bounds];
        s.option_optionContents = arrM;
        
        [[s option_setupPopOption:^(NSInteger index, NSString *content) {
            NSLog(@"你选中了第%ld行 选项为：%@", index, content);
            if (index > 0) {
             NSDictionary *dict =  self.keshiS[index - 1];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"keshi_click" object:nil userInfo:dict];
            }
        } whichFrame:frame animate:YES] option_show];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
         [SVProgressHUD dismiss];
        
    }];
}



-(void)loadBody{

    CGFloat btn_w = Screen_W * 0.5;
    CGFloat btn_h = 44;
    
    NSMutableArray *arrM = [NSMutableArray array];
    for (int a = 0; a<self.titleS.count; a++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(a * btn_w, 64, btn_w, btn_h);
        [btn setTitle:self.titleS[a] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [arrM addObject:btn];
        btn.tag = a;
        [self.view addSubview:btn];
        
        if (a == 0) {
            [self changeBtnColor:btn];
        }
    }
    
    self.btnArray = arrM;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + btn_h, btn_w, 1.5)];
    self.line = line;
    line.backgroundColor = RGBACOLOR(76, 173, 76, 1.0) ;
    [self.view addSubview:line];
    
    self.scrollview.contentSize = CGSizeMake(Screen_W * 2, 0);
    
    [self sickVc];
    [self weiJiVc];
}

-(void)btnClick:(UIButton*)btn{
    [self changeBtnColor:btn];
    [self moveYellowLable:btn];
    
    //改变偏移量
    self.scrollview.contentOffset = CGPointMake(btn.tag * Screen_W, 0);
}

//改变颜色
-(void)changeBtnColor:(UIButton *)btn{
    [_selbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:RGBACOLOR(76, 173, 76, 1.0) forState:UIControlStateNormal];
    _selbtn = btn;
}

//移动小滑块
//小黄快的移动
-(void)moveYellowLable:(UIButton*)btn{
    NSInteger i = btn.tag;
    CGFloat width = self.line.width;
    CGRect orFrame = self.line.frame;
    orFrame.origin.x = width * i;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.line.frame = orFrame;
    }];
}


//scollview的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger i = scrollView.contentOffset.x / Screen_W;
    UIButton *btn = self.btnArray[i];
    
    [self changeBtnColor:btn];
    [self moveYellowLable:btn];
}



@end

//
//  ZXKeShidetaiView.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.

#import "ZXKeShidetaiView.h"

@implementation ZXKeShidetaiView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *disName = [[UILabel alloc] init];
        [disName setFont:[UIFont systemFontOfSize:15]];
        self.disName = disName;
        [self addSubview:disName];
        
        
        UILabel *bed = [[UILabel alloc] init];
        self.bed = bed;
        bed.text = @"床";
        [bed setTextAlignment:NSTextAlignmentCenter];
        [bed setTextColor:[UIColor whiteColor]];
        bed.backgroundColor = mainColor;
        [bed setFont:[UIFont systemFontOfSize:13]];
        bed.layer.cornerRadius = 3;
        bed.layer.masksToBounds = YES;
        [self addSubview:bed];
        
        
        UILabel *bedNo = [[UILabel alloc] init];
        [bedNo setFont:[UIFont systemFontOfSize:12]];
        self.bedNo = bedNo;
        [self addSubview:bedNo];
        
        
        UILabel *doc = [[UILabel alloc] init];
        self.doc = doc;
        doc.text = @"主管医生";
        [doc setTextAlignment:NSTextAlignmentCenter];
        [doc setTextColor:[UIColor whiteColor]];
        doc.backgroundColor = mainColor;
        [doc setFont:[UIFont systemFontOfSize:13]];
        doc.layer.cornerRadius = 3;
        doc.layer.masksToBounds = YES;
        [self addSubview:doc];
        
        
        UILabel *docName = [[UILabel alloc] init];
        [docName setFont:[UIFont systemFontOfSize:12]];
        self.docName = docName;
        [self addSubview:docName];
        
        
        UILabel *sex = [[UILabel alloc] init];
        sex.text = @"性别";
        sex.textColor = [UIColor lightGrayColor];
        [sex setFont:[UIFont systemFontOfSize:12]];
        self.sex = sex;
        [self addSubview:sex];
        
        UILabel *sexValue = [[UILabel alloc] init];
        [sexValue setFont:[UIFont systemFontOfSize:12]];
        self.sexValue = sexValue;
        [self addSubview:sexValue];
        
        
        UILabel *zhuYuan = [[UILabel alloc] init];
        [zhuYuan setFont:[UIFont systemFontOfSize:12]];
        self.zhuYuan = zhuYuan;
        zhuYuan.text = @"住院编号";
        zhuYuan.textColor = [UIColor lightGrayColor];
        [self addSubview:zhuYuan];
        
        
        UILabel *zhuYuanNo = [[UILabel alloc] init];
        [zhuYuanNo setFont:[UIFont systemFontOfSize:12]];
        self.zhuYuanNo = zhuYuanNo;
        [self addSubview:zhuYuanNo];
        
        UILabel *age = [[UILabel alloc] init];
        age.text = @"年龄";
        age.textColor = [UIColor lightGrayColor];
        [age setFont:[UIFont systemFontOfSize:12]];
        self.age = age;
        [self addSubview:age];
        
        UILabel *ageValue = [[UILabel alloc] init];
        [ageValue setFont:[UIFont systemFontOfSize:12]];
        self.ageValue = ageValue;
        [self addSubview:ageValue];
        
        UILabel *ruYuan = [[UILabel alloc] init];
        [ruYuan setFont:[UIFont systemFontOfSize:12]];
        self.ruYuan = ruYuan;
        ruYuan.text = @"入院日期";
        ruYuan.textColor = [UIColor lightGrayColor];
        [self addSubview:ruYuan];
        
        
        UILabel *ruYuanData = [[UILabel alloc] init];
        [ruYuanData setFont:[UIFont systemFontOfSize:12]];
        self.ruYuanData = ruYuanData;
        [self addSubview:ruYuanData];
        
        UILabel *xingZhi = [[UILabel alloc] init];
        xingZhi.text = @"性质";
        xingZhi.textColor = [UIColor lightGrayColor];
        [xingZhi setFont:[UIFont systemFontOfSize:12]];
        self.xingZhi = xingZhi;
        [self addSubview:xingZhi];
        
        UILabel *xingZhiDet = [[UILabel alloc] init];
        [xingZhiDet setFont:[UIFont systemFontOfSize:12]];
        self.xingZhiDet = xingZhiDet;
        [self addSubview:xingZhiDet];
        
        UILabel *huLi = [[UILabel alloc] init];
        [huLi setFont:[UIFont systemFontOfSize:12]];
        self.huLi = huLi;
        huLi.text = @"护理级别";
        huLi.textColor = [UIColor lightGrayColor];
        [self addSubview:huLi];
        
        UILabel *huLiDet = [[UILabel alloc] init];
        [huLiDet setFont:[UIFont systemFontOfSize:12]];
        self.huLiDet = huLiDet;
        [self addSubview:huLiDet];
        
        UILabel *disease = [[UILabel alloc] init];
        [disease setFont:[UIFont systemFontOfSize:12]];
        self.disease = disease;
        disease.text = @"病人诊断";
        disease.textColor = [UIColor lightGrayColor];
        [self addSubview:disease];
        
        UILabel *diseaseName = [[UILabel alloc] init];
        [diseaseName setFont:[UIFont systemFontOfSize:12]];
        self.diseaseName = diseaseName;
        [self addSubview:diseaseName];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.disName.frame = CGRectMake(12, 8, 52, 21);
    self.bed.frame = CGRectMake(CGRectGetMaxX(self.disName.frame) + 8, 10, 16, 16);
    self.bedNo.frame = CGRectMake(CGRectGetMaxX(self.bed.frame) + 8, 10, 66, 16);
    self.doc.frame = CGRectMake(Screen_W * 0.5, 10, 58, 16);
    self.docName.frame = CGRectMake(CGRectGetMaxX(self.doc.frame) + 10, 10, 52, 16);
    
    self.sex.frame = CGRectMake(13, CGRectGetMaxY(self.disName.frame) + 5, 25, 16);
    self.sexValue.frame = CGRectMake(CGRectGetMaxX(self.sex.frame) + 8 ,self.sex.size_y, 21, 16);
    self.zhuYuan.frame = CGRectMake(Screen_W * 0.5,self.sex.size_y, 52, 16);
    self.zhuYuanNo.frame = CGRectMake(CGRectGetMaxX(self.zhuYuan.frame) + 13,self.sex.size_y, 48, 16);
    self.age.frame = CGRectMake(13, CGRectGetMaxY(self.sex.frame) + 3, 25, 16);
    self.ageValue.frame = CGRectMake(CGRectGetMaxX(self.age.frame) + 8 ,self.age.size_y, 21, 16);
    self.ruYuan.frame = CGRectMake(Screen_W * 0.5,self.age.size_y, 52, 16);
    self.ruYuanData.frame = CGRectMake(CGRectGetMaxX(self.ruYuan.frame) + 13,self.ruYuan.size_y, 100, 16);
    self.xingZhi.frame = CGRectMake(13,CGRectGetMaxY(self.age.frame) + 3, 25, 16);
    self.xingZhiDet.frame = CGRectMake(self.ageValue.size_x,self.xingZhi.size_y, 45, 16);
    
    self.huLi.frame = CGRectMake(Screen_W * 0.5,self.xingZhi.size_y, 52, 16);
    self.huLiDet.frame = CGRectMake(self.ruYuanData.size_x, self.huLi.size_y, 100, 16);
    
    self.disease.frame = CGRectMake(13,CGRectGetMaxY(self.xingZhi.frame) + 3, 52, 16);
    
    self.diseaseName.frame = CGRectMake(CGRectGetMaxX(self.disease.frame) + 13,self.disease.size_y, 200, 16);
}




@end

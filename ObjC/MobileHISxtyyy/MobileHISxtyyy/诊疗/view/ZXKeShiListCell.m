//
//  ZXKeShiListCell.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/27.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXKeShiListCell.h"
#import "ZXKeShiListModel.h"
@interface ZXKeShiListCell ()

@property(nonatomic,weak) UILabel *disName;
@property(nonatomic,weak) UILabel *bed;
@property(nonatomic,weak) UILabel *bedNo;
@property(nonatomic,weak) UILabel *doc;
@property(nonatomic,weak) UILabel *docName;
@property(nonatomic,weak) UILabel *sex;
@property(nonatomic,weak) UILabel *sexValue;
@property(nonatomic,weak) UILabel *zhuYuan;
@property(nonatomic,weak) UILabel *zhuYuanNo;
@property(nonatomic,weak) UILabel *age;
@property(nonatomic,weak) UILabel *ageValue;
@property(nonatomic,weak) UILabel *ruYuan;
@property(nonatomic,weak) UILabel *ruYuanData;
@property(nonatomic,weak) UILabel *disease;
@property(nonatomic,weak) UILabel *diseaseName;


@end

@implementation ZXKeShiListCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *disName = [[UILabel alloc] init];
        [disName setFont:[UIFont systemFontOfSize:14]];
        self.disName = disName;
        [self.contentView addSubview:disName];
        
        
        UILabel *bed = [[UILabel alloc] init];
        self.bed = bed;
        bed.text = @"床";
        [bed setTextAlignment:NSTextAlignmentCenter];
        [bed setTextColor:[UIColor whiteColor]];
        bed.backgroundColor = mainColor;
        [bed setFont:[UIFont systemFontOfSize:12]];
        bed.layer.cornerRadius = 3;
        bed.layer.masksToBounds = YES;
        [self.contentView addSubview:bed];
        
        
        UILabel *bedNo = [[UILabel alloc] init];
        [bedNo setFont:[UIFont systemFontOfSize:11]];
        self.bedNo = bedNo;
        [self.contentView addSubview:bedNo];
        
        
        UILabel *doc = [[UILabel alloc] init];
        self.doc = doc;
        doc.text = @"主管医生";
        [doc setTextAlignment:NSTextAlignmentCenter];
        [doc setTextColor:[UIColor whiteColor]];
        doc.backgroundColor = mainColor;
        [doc setFont:[UIFont systemFontOfSize:12]];
        doc.layer.cornerRadius = 3;
        doc.layer.masksToBounds = YES;
        [self.contentView addSubview:doc];
        
        
        UILabel *docName = [[UILabel alloc] init];
        [docName setFont:[UIFont systemFontOfSize:11]];
        self.docName = docName;
        [self.contentView addSubview:docName];
        
        
        UILabel *sex = [[UILabel alloc] init];
        sex.text = @"性别";
        sex.textColor = [UIColor lightGrayColor];
        [sex setFont:[UIFont systemFontOfSize:11]];
        self.sex = sex;
        [self.contentView addSubview:sex];
        
        UILabel *sexValue = [[UILabel alloc] init];
        [sexValue setFont:[UIFont systemFontOfSize:11]];
        self.sexValue = sexValue;
        [self.contentView addSubview:sexValue];
        
        
        UILabel *zhuYuan = [[UILabel alloc] init];
        [zhuYuan setFont:[UIFont systemFontOfSize:11]];
        self.zhuYuan = zhuYuan;
        zhuYuan.text = @"住院编号";
        zhuYuan.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:zhuYuan];
        
        
        UILabel *zhuYuanNo = [[UILabel alloc] init];
        [zhuYuanNo setFont:[UIFont systemFontOfSize:11]];
        self.zhuYuanNo = zhuYuanNo;
        [self.contentView addSubview:zhuYuanNo];
        
        UILabel *age = [[UILabel alloc] init];
        age.text = @"年龄";
        age.textColor = [UIColor lightGrayColor];
        [age setFont:[UIFont systemFontOfSize:11]];
        self.age = age;
        [self.contentView addSubview:age];
        
        UILabel *ageValue = [[UILabel alloc] init];
        [ageValue setFont:[UIFont systemFontOfSize:11]];
        self.ageValue = ageValue;
        [self.contentView addSubview:ageValue];
        
        UILabel *ruYuan = [[UILabel alloc] init];
        [ruYuan setFont:[UIFont systemFontOfSize:11]];
        self.ruYuan = ruYuan;
        ruYuan.text = @"入院日期";
        ruYuan.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:ruYuan];
        
        
        UILabel *ruYuanData = [[UILabel alloc] init];
        [ruYuanData setFont:[UIFont systemFontOfSize:11]];
        self.ruYuanData = ruYuanData;
        [self.contentView addSubview:ruYuanData];
        
        UILabel *disease = [[UILabel alloc] init];
        [disease setFont:[UIFont systemFontOfSize:11]];
        self.disease = disease;
        disease.text = @"病人诊断";
        disease.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:disease];
        
        UILabel *diseaseName = [[UILabel alloc] init];
        [diseaseName setFont:[UIFont systemFontOfSize:11]];
        self.diseaseName = diseaseName;
        [self.contentView addSubview:diseaseName];
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.disName.frame = CGRectMake(12, 8, 45, 21);
    self.bed.frame = CGRectMake(CGRectGetMaxX(self.disName.frame) + 8, 10, 16, 16);
    self.bedNo.frame = CGRectMake(CGRectGetMaxX(self.bed.frame) + 8, 10, 66, 16);
    self.doc.frame = CGRectMake(Screen_W * 0.5, 10, 52, 16);
    self.docName.frame = CGRectMake(CGRectGetMaxX(self.doc.frame) + 10, 10, 52, 16);
    self.sex.frame = CGRectMake(13, CGRectGetMaxY(self.disName.frame) + 5, 25, 16);
    self.sexValue.frame = CGRectMake(CGRectGetMaxX(self.sex.frame) + 8 ,self.sex.size_y, 21, 16);
    self.zhuYuan.frame = CGRectMake(Screen_W * 0.5,self.sex.size_y, 48, 16);
    self.zhuYuanNo.frame = CGRectMake(CGRectGetMaxX(self.zhuYuan.frame) + 13,self.sex.size_y, 48, 16);
    self.age.frame = CGRectMake(13, CGRectGetMaxY(self.sex.frame) , 25, 16);
    self.ageValue.frame = CGRectMake(CGRectGetMaxX(self.age.frame) + 8 ,self.age.size_y, 21, 16);
    self.ruYuan.frame = CGRectMake(Screen_W * 0.5,self.age.size_y, 48, 16);
    self.ruYuanData.frame = CGRectMake(CGRectGetMaxX(self.ruYuan.frame) + 13,self.ruYuan.size_y, 100, 16);
    self.disease.frame = CGRectMake(13,CGRectGetMaxY(self.age.frame), 48, 16);
    self.diseaseName.frame = CGRectMake(CGRectGetMaxX(self.disease.frame) + 13,self.disease.size_y, 200, 16);
    
}


-(void)setModel:(ZXKeShiListModel *)model{
    _model = model;
    self.disName.text = model.name;
    self.bedNo.text = model.bedNumber;
    self.docName.text = model.doctorName;
    self.sexValue.text = model.gender;
    self.zhuYuanNo.text = model.hospitalId;
    self.ageValue.text = model.age;
    self.ruYuanData.text = model.admissionDate;
    self.diseaseName.text = model.diagnosis;
}



@end

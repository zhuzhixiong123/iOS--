//
//  ZXJianChaDetailCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/29.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXJianChaDetailCell.h"
#import "ZXJianChaDetailModel.h"
@interface ZXJianChaDetailCell ()

@property(nonatomic,weak) UILabel *titleL;
@property(nonatomic,weak) UIView *line;
@property(nonatomic,weak) UILabel *resultL;
@property(nonatomic,weak) UILabel *resultNum;
@property(nonatomic,weak) UILabel *resultTitle;
@property(nonatomic,weak) UILabel *normalL;
@property(nonatomic,weak) UILabel *normalVaiue;

@end

@implementation ZXJianChaDetailCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.layer.borderWidth = 0.3;
        self.layer.borderColor = RGBACOLOR(167, 167, 167, 1.0).CGColor;
        
        UILabel *titleL  = [[UILabel alloc] init];
        [titleL setFont:[UIFont systemFontOfSize:13]];
        self.titleL = titleL;
        [self.contentView addSubview:titleL];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = RGBACOLOR(223, 223, 223, 1.0);
        self.line = line;
        [self.contentView addSubview:line];
        
        UILabel *resultL  = [[UILabel alloc] init];
        [resultL setFont:[UIFont systemFontOfSize:12]];
        [resultL setTextColor:[UIColor lightGrayColor]];
        self.resultL = resultL;
        [self.contentView addSubview:resultL];
        
        UILabel *resultNum  = [[UILabel alloc] init];
        [resultNum setFont:[UIFont systemFontOfSize:12]];
        [resultNum setTextColor:mainColor];
        self.resultNum = resultNum;
        [self.contentView addSubview:resultNum];
        
        UILabel *resultTitle  = [[UILabel alloc] init];
        [resultTitle setFont:[UIFont systemFontOfSize:12]];
        [resultTitle setTextColor:[UIColor redColor]];
        self.resultTitle = resultTitle;
        [self.contentView addSubview:resultTitle];
        
        UILabel *normalL  = [[UILabel alloc] init];
        [normalL setFont:[UIFont systemFontOfSize:12]];
        [normalL setTextColor:[UIColor lightGrayColor]];
        self.normalL = normalL;
        [self.contentView addSubview:normalL];
        
        UILabel *normalVaiue  = [[UILabel alloc] init];
        [normalVaiue setFont:[UIFont systemFontOfSize:12]];
        self.normalVaiue = normalVaiue;
        [self.contentView addSubview:normalVaiue];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat restValue_W = [[NSString alloc] widthWithText:self.resultNum.text andFont:12 andHight:15];
    
    self.titleL.frame = CGRectMake(12, 5, Screen_W - 24, 16);
    self.line.frame = CGRectMake(12, CGRectGetMaxY(self.titleL.frame) + 5, Screen_W - 12, 1);
    self.resultL.frame = CGRectMake(12, CGRectGetMaxY(self.line.frame) + 6, 36, 15);
    self.resultNum.frame = CGRectMake(CGRectGetMaxX(self.resultL.frame)+ 2, self.resultL.size_y, restValue_W, 15);
    self.resultTitle.frame = CGRectMake(CGRectGetMaxX(self.resultNum.frame) + 10, self.resultL.size_y, 18, 15);
    
    self.normalL.frame = CGRectMake(Screen_W * 0.4, self.resultL.size_y, 45, 15);
    
    self.normalVaiue.frame = CGRectMake(CGRectGetMaxX(self.normalL.frame) + 6, self.normalL.size_y, 150, 15);
}

-(void)setModel:(ZXJianChaDetailModel *)model{
    _model = model;
    
    self.titleL.text = model.sampleName;
    self.resultL.text = @"结果";
    self.resultNum.text = model.sampleResult;
    self.normalL.text = @"正常值";
    self.resultTitle.text = @"";
    
    if (model.refMinValue.length == 0) {
        model.refMinValue = @"";
    }
    
    if (model.refMaxValue.length == 0) {
        model.refMaxValue = @"";
    }
    
    if (model.sampleUnit.length == 0) {
        model.sampleUnit = @"";
    }
    
    self.normalVaiue.text = [NSString stringWithFormat:@"%@ - %@ %@",model.refMinValue,model.refMaxValue,model.sampleUnit];
    
    if ([model.hint isEqualToString:@"↑"]) {
        self.resultTitle.text = @"高";
        self.resultNum.textColor = [UIColor redColor];
    }
    
    if ([model.hint isEqualToString:@"↓"]) {
        self.resultTitle.text = @"低";
        self.resultNum.textColor = [UIColor redColor];
    }
    
    if ([self.model.refMinValue isEqualToString:@"阴性"]) {
        self.normalVaiue.text = @"阴性";
    }
    
    if ([model.refMinValue isEqualToString:@"无 "] || [model.refMinValue isEqualToString:@"无"] ) {
        self.normalVaiue.text = @"无数据";
    }
}


@end


















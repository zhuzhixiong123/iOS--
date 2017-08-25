//
//  ZXYiZhuCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXYiZhuCell.h"
#import "ZXYiZhuModel.h"
@interface ZXYiZhuCell ()

@property(nonatomic,weak) UILabel *timeL;
@property(nonatomic,weak) UILabel *contL;
@property(nonatomic,weak) UILabel *jiLaing;
@property(nonatomic,weak) UILabel *jiLiangValue;
@property(nonatomic,weak) UILabel *num;
@property(nonatomic,weak) UILabel *numValue;
@property(nonatomic,weak) UILabel *pinCi;
@property(nonatomic,weak) UILabel *pinCiValue;
@property(nonatomic,weak) UILabel *yongFa;
@property(nonatomic,weak) UILabel *yongFaValue;

@end

@implementation ZXYiZhuCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *timeL = [[UILabel alloc] init];
        [timeL setFont:[UIFont systemFontOfSize:12]];
        self.timeL = timeL;
        [self.contentView addSubview:timeL];
        
        UILabel *contL = [[UILabel alloc] init];
        [contL setFont:[UIFont systemFontOfSize:12]];
        self.contL = contL;
        [self.contentView addSubview:contL];
        
        UILabel *jiLaing = [[UILabel alloc] init];
        jiLaing.textColor = [UIColor lightGrayColor];
        [jiLaing setFont:[UIFont systemFontOfSize:12]];
        self.jiLaing = jiLaing;
        [self.contentView addSubview:jiLaing];
        
        UILabel *jiLiangValue = [[UILabel alloc] init];
        [jiLiangValue setFont:[UIFont systemFontOfSize:12]];
        self.jiLiangValue = jiLiangValue;
        [self.contentView addSubview:jiLiangValue];
        
        UILabel *num = [[UILabel alloc] init];
        num.textColor = [UIColor lightGrayColor];
        [num setFont:[UIFont systemFontOfSize:12]];
        self.num = num;
        [self.contentView addSubview:num];
        
        UILabel *numValue = [[UILabel alloc] init];
        [numValue setFont:[UIFont systemFontOfSize:12]];
        self.numValue = numValue;
        [self.contentView addSubview:numValue];
        
        UILabel *pinCi = [[UILabel alloc] init];
        pinCi.textColor = [UIColor lightGrayColor];
        [pinCi setFont:[UIFont systemFontOfSize:12]];
        self.pinCi = pinCi;
        [self.contentView addSubview:pinCi];
        
        UILabel *pinCiValue = [[UILabel alloc] init];
        [pinCiValue setFont:[UIFont systemFontOfSize:12]];
        self.pinCiValue = pinCiValue;
        [self.contentView addSubview:pinCiValue];
        
        UILabel *yongFa = [[UILabel alloc] init];
        yongFa.textColor = [UIColor lightGrayColor];
        [yongFa setFont:[UIFont systemFontOfSize:12]];
        self.yongFa = yongFa;
        [self.contentView addSubview:yongFa];
        
        UILabel *yongFaValue = [[UILabel alloc] init];
        [yongFaValue setFont:[UIFont systemFontOfSize:12]];
        self.yongFaValue = yongFaValue;
        [self.contentView addSubview:yongFaValue];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat jiLiangwidth = [[NSString alloc] widthWithText:self.model.dose andFont:12 andHight:16];
    CGFloat piciWidth = [[NSString alloc] widthWithText:self.model.frequency andFont:12 andHight:16];
    
    self.timeL.frame = CGRectMake(12, 8, 200, 16);
    self.contL.frame = CGRectMake(12, CGRectGetMaxY(self.timeL.frame) + 4, Screen_W - 24, 16);
    self.jiLaing.frame = CGRectMake(12, CGRectGetMaxY(self.contL.frame) + 4, 28, 16);
    self.jiLiangValue.frame = CGRectMake(CGRectGetMaxX(self.jiLaing.frame) + 4 ,self.jiLaing.size_y, jiLiangwidth, 16);
    self.num.frame = CGRectMake(CGRectGetMaxX(self.jiLiangValue.frame) + 7 ,self.jiLaing.size_y, 28, 16);
    self.numValue.frame = CGRectMake(CGRectGetMaxX(self.num.frame) + 4 ,self.jiLaing.size_y, 28, 16);
    self.pinCi.frame = CGRectMake(CGRectGetMaxX(self.numValue.frame)  ,self.jiLaing.size_y, 28, 16);
    self.pinCiValue.frame = CGRectMake(CGRectGetMaxX(self.pinCi.frame) + 4 ,self.jiLaing.size_y, piciWidth, 16);
    self.yongFa.frame = CGRectMake(CGRectGetMaxX(self.pinCiValue.frame) + 7 ,self.jiLaing.size_y, 28, 16);
    self.yongFaValue.frame = CGRectMake(CGRectGetMaxX(self.yongFa.frame) + 4 ,self.jiLaing.size_y, 100, 16);
}

-(void)setModel:(ZXYiZhuModel *)model{
    _model = model;
    self.timeL.text = model.startTime;
    self.contL.text = model.title;
    self.jiLaing.text = @"剂量";
    self.jiLiangValue.text = model.dose;
    self.num.text = @"数量";
    self.numValue.text = model.quantity;
    self.pinCi.text = @"频次";
    self.pinCiValue.text = model.frequency;
    self.yongFa.text = @"用法";
    self.yongFaValue.text = model.unitPrice;
}






























@end

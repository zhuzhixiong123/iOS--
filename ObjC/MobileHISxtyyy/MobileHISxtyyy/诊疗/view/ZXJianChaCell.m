//
//  ZXJianChaCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXJianChaCell.h"
#import "ZXJianChaModel.h"
@interface ZXJianChaCell ()

@property(nonatomic,weak) UILabel *dataL;
@property(nonatomic,weak) UILabel *numL;
@property(nonatomic,weak) UILabel *titleL;

@end

@implementation ZXJianChaCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *dataL = [[UILabel alloc] init];
        dataL.textColor = [UIColor lightGrayColor];
        [dataL setFont:[UIFont systemFontOfSize:12]];
        self.dataL = dataL;
        [self.contentView addSubview:dataL];
        
        UILabel *numL = [[UILabel alloc] init];
        [numL setTextAlignment:NSTextAlignmentRight];
        numL.textColor = [UIColor lightGrayColor];
        [numL setFont:[UIFont systemFontOfSize:12]];
        self.numL = numL;
        [self.contentView addSubview:numL];
        
        UILabel *titleL = [[UILabel alloc] init];
        titleL.numberOfLines = 0;
        [titleL setFont:[UIFont systemFontOfSize:12]];
        self.titleL = titleL;
        [self.contentView addSubview:titleL];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat hight = [[NSString alloc] heightWithText:self.model.sampleName andFont:12 andWidth:Screen_W - 24];
    
    self.dataL.frame = CGRectMake(12, 8, Screen_W * 0.5, 16);
    self.numL.frame = CGRectMake(Screen_W * 0.5, 8, Screen_W * 0.5 - 12, 16);
    self.titleL.frame = CGRectMake(12, CGRectGetMaxY(self.dataL.frame) + 3, Screen_W - 24, hight);

}


-(void)setModel:(ZXJianChaModel *)model{
    _model = model;
    self.dataL.text = model.sampleTime;
    self.numL.text = model.sampleNo;
    self.titleL.text = model.sampleName;
}











@end

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



@end

@implementation ZXKeShiListCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *disName = [[UILabel alloc] init];
        [disName setFont:[UIFont systemFontOfSize:14]];
        self.disName = disName;
        [self.contentView addSubview:disName];
        
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.disName.frame = CGRectMake(12, 12, 200, 21);

}


-(void)setModel:(ZXKeShiListModel *)model{
    _model = model;
    self.disName.text = model.name;

}



@end

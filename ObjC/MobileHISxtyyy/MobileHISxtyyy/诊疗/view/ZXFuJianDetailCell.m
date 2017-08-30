//
//  ZXFuJianDetailCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/30.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXFuJianDetailCell.h"

@implementation ZXFuJianDetailCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleL = [[UILabel alloc] init];
        [titleL setFont:[UIFont systemFontOfSize:13]];
        self.titleL = titleL;
        [self.contentView addSubview:titleL];
        
        UILabel *contL = [[UILabel alloc] init];
        [contL setFont:[UIFont systemFontOfSize:13]];
        contL.textColor = [UIColor lightGrayColor];
        self.contL = contL;
        contL.numberOfLines = 0;
        [self.contentView addSubview:contL];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleL.frame = CGRectMake(12, 10, Screen_W - 24, 16);
    self.contL.frame = CGRectMake(12, CGRectGetMaxY(self.titleL.frame), Screen_W - 24, self.height - 30);
}

@end

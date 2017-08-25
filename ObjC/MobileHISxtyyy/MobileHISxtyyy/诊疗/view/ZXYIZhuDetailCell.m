//
//  ZXYIZhuDetailCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/25.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXYIZhuDetailCell.h"

@implementation ZXYIZhuDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleL = [[UILabel alloc] init];
        [titleL setFont:[UIFont boldSystemFontOfSize:12]];
        self.titleL = titleL;
        [self.contentView addSubview:titleL];
        
        
        UILabel *vulueL = [[UILabel alloc] init];
        [vulueL setFont:[UIFont systemFontOfSize:12]];
        self.vulueL = vulueL;
        [self.contentView addSubview:vulueL];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleL.frame = CGRectMake(16, (self.height - 16) * 0.5, 80, 15);
    self.vulueL.frame = CGRectMake(CGRectGetMaxX(self.titleL.frame), (self.height - 16) * 0.5, 200, 15);
}

@end











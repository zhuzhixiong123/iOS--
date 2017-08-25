//
//  ZXRuYuanCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/23.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXRuYuanCell.h"

@implementation ZXRuYuanCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titles = [[UILabel alloc] init];
        titles.font = [UIFont systemFontOfSize:14];
        self.titles = titles;
        [self.contentView addSubview:titles];
        
        
        UILabel *contLable = [[UILabel alloc] init];
        contLable.font = [UIFont systemFontOfSize:14];
        self.contLable = contLable;
        contLable.numberOfLines = 0;
        [self.contentView addSubview:contLable];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titles.frame = CGRectMake(12, 8, Screen_W - 24, 18);
    self.contLable.frame = CGRectMake(12, CGRectGetMaxY(self.titles.frame)+2, Screen_W - 24, self.height - 38);
}





@end

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
        [self.contentView addSubview:contLable];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    

}


@end

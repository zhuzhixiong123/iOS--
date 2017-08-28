//
//  ZXFirstCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/28.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXFirstCell.h"
#import "ZXFirstModel.h"


@interface ZXFirstCell ()
@property(nonatomic,weak) UILabel *titleL;
@end


@implementation ZXFirstCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleL = [[UILabel alloc] init];
        titleL.numberOfLines = 0;
        titleL.font = [UIFont systemFontOfSize:12];
        titleL.textColor = [UIColor lightGrayColor];
        self.titleL = titleL;
        [self.contentView addSubview:titleL];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat height = [[NSString alloc] heightWithText:self.titleL.text andFont:12 andWidth:Screen_W - 24];
    self.titleL.frame = CGRectMake(12, 5, Screen_W - 24, height);
}

-(void)setModel:(ZXFirstModel *)model{
    _model = model;
    self.titleL.text = model.titles;

}

@end

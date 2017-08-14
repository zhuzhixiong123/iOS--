//
//  testCell.m
//  test
//
//  Created by xianxun on 2017/8/10.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "testCell.h"

@interface testCell ()

@property(nonatomic,weak) UIView *contView;
@property(nonatomic,weak) UILabel *titleL;
@property(nonatomic,weak) UIView *line;

@end


@implementation testCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *contView = [[UIView alloc] init];
        contView.layer.cornerRadius = 5;
        contView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        self.contView = contView;
        [self.contentView addSubview:contView];
        
        
        UILabel *titleL = [[UILabel alloc] init];
        titleL.text = @"测试标题 -- 2012 -- 08:00";
        [titleL setFont:[UIFont systemFontOfSize:13]];
        self.titleL = titleL;
        [self.contView addSubview:titleL];
        
        
        UIView *line = [[UIView alloc] init];
        self.line  =line;
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contView addSubview:line];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contView.frame = CGRectMake(20, 6, self.bounds.size.width - 40, self.bounds.size.height - 12);

    self.titleL.frame = CGRectMake(12, 6, 200, 15);
    self.line.frame = CGRectMake(0, 25, self.contView.bounds.size.width, 1.5);

}




@end












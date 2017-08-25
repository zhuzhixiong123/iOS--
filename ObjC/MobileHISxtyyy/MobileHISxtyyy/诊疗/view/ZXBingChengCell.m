//
//  ZXBingChengCell.m
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/24.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "ZXBingChengCell.h"
#import "ZXBingChengModel.h"

@interface ZXBingChengCell ()

@property(nonatomic,weak) UILabel *headL;
@property(nonatomic,weak) UILabel *contL;
@property(nonatomic,weak) UILabel *bottomL;

@property(nonatomic,weak) UIButton *btn;

@end

@implementation ZXBingChengCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *headL = [[UILabel alloc] initWithFrame:CGRectMake(12, 8, Screen_W - 80, 16)];
        [headL setFont:[UIFont systemFontOfSize:14]];
        self.headL = headL;
        [self.contentView addSubview:headL];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_W - 60, headL.size_y, 60, 16)];
        self.btn = btn;
        [btn setTitle:@"展开" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:btn];
        
        
        UILabel *contL = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(headL.frame) + 2, Screen_W - 24, 60)];
        contL.numberOfLines = 0;
        contL.textColor = [UIColor lightGrayColor];
        [contL setFont:[UIFont systemFontOfSize:14]];
        self.contL = contL;
        [self.contentView addSubview:contL];
        
        UILabel *bottomL = [[UILabel alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(headL.frame) + 64, Screen_W - 12, 16)];
        [bottomL setTextAlignment:NSTextAlignmentRight];
        bottomL.textColor = [UIColor lightGrayColor];
        [bottomL setFont:[UIFont systemFontOfSize:14]];
        self.bottomL = bottomL;
        [self.contentView addSubview:bottomL];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.model.isShowMoreText) {
        
        CGSize maxSize = CGSizeMake(Screen_W - 2 * 12, MAXFLOAT);
        NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGSize text_size = [self.contL.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        
        self.contL.frame = CGRectMake(12,CGRectGetMaxY(self.headL.frame) + 5, Screen_W - 24, text_size.height);
        self.bottomL.frame = CGRectMake(0, CGRectGetMaxY(self.contL.frame) + 5, Screen_W - 12, 16);
        [self.btn setTitle:@"收缩" forState:UIControlStateNormal];
    }
    
    else{
        self.contL.frame = CGRectMake(12,CGRectGetMaxY(self.headL.frame) + 2, Screen_W - 24, 60);
        self.bottomL.frame = CGRectMake(0, CGRectGetMaxY(self.contL.frame) + 5, Screen_W - 12, 16);
        [self.btn setTitle:@"展开" forState:UIControlStateNormal];
    }
}

-(void)setModel:(ZXBingChengModel *)model{
    _model = model;
    self.headL.text = model.titleL;
    self.contL.text = model.contL;
    self.bottomL.text = model.bottomL;

}

// MARK: - 获取展开后的高度
+ (CGFloat)moreHeight:(ZXBingChengModel *)model{
    // 展开后得高度 = 计算出文本内容的高度 + 固定控件的高度
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    
    NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
    
    CGSize size = [model.contL boundingRectWithSize:CGSizeMake(Screen_W - 24, 0) options:option attributes:attribute context:nil].size;
    return size.height + 64;
}

-(void)btnClick{
    self.model.isShowMoreText = !self.model.isShowMoreText;
    
    if ([self.delegate respondsToSelector:@selector(bingChengCellClickByCell:)]) {
        [self.delegate bingChengCellClickByCell:self];
    }
}



@end

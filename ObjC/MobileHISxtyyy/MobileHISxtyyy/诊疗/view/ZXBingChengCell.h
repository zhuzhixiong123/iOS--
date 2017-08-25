//
//  ZXBingChengCell.h
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/24.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXBingChengModel;

@protocol ZXBingChengCellDelegate <NSObject>

@optional
-(void)bingChengCellClickByCell:(UITableViewCell*)cell;

@end


@interface ZXBingChengCell : UITableViewCell

@property(nonatomic,strong) ZXBingChengModel *model;

@property(nonatomic,weak) id<ZXBingChengCellDelegate> delegate;

+ (CGFloat)moreHeight:(ZXBingChengModel *)model;

@end

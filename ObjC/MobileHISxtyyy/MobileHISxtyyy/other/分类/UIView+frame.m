//
//  UIView+frame.m
//  baiSiJie
//
//  Created by 志雄 朱 on 16/9/5.
//  Copyright © 2016年 xiaohei. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

-(void)setWidth:(CGFloat)width{

   CGRect oriFrame = self.frame;
    oriFrame.size.width = width;
    self.frame = oriFrame;

}

-(CGFloat)width{

    return self.frame.size.width;
}


-(void)setHeight:(CGFloat)height{
    CGRect oriFrame = self.frame;
    oriFrame.size.height = height;
    self.frame = oriFrame;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setSize_x:(CGFloat)size_x{

    CGRect oriFrame = self.frame;
    oriFrame.origin.x = size_x;
    self.frame = oriFrame;

}

-(CGFloat)size_x{
    return self.frame.origin.x;
}

-(void)setSize_y:(CGFloat)size_y{
    CGRect oriFrame = self.frame;
    oriFrame.origin.y = size_y;
    self.frame = oriFrame;

}

-(CGFloat)size_y{
    return self.frame.origin.y;
}




@end

//
//  ZXFuJianModel.h
//  MobileHISxtyyy
//
//  Created by xianxun on 2017/8/30.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXFuJianModel : NSObject

@property(nonatomic,copy) NSString *ultraSoundPart;
@property(nonatomic,copy) NSString *resultDescription;
@property(nonatomic,copy) NSString *reportDoctor;
@property(nonatomic,copy) NSString *reportTime;
@property(nonatomic,copy) NSString *yyValue;
@property(nonatomic,copy) NSString *doctorComment;
@property(nonatomic,strong) NSArray *images;

@end

/*
 "ultraSoundPart":"肝,胆,胰,脾",
 "resultDescription":"肝脏形态大小正常,边缘锐利，包膜光整，实质光点增多，回声均。",
 "reportDoctor":"吴蓉",
 "reportTime":1503970140000,
 "yyValue":null,
 "images":Array[5]
 */

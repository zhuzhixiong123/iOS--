//
//  ZXKeShiListModel.h
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/27.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXKeShiListModel : NSObject

@property(nonatomic,copy) NSString *patientId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *gender;
@property(nonatomic,copy) NSString *age;
@property(nonatomic,copy) NSString *hospitalId;
@property(nonatomic,copy) NSString *admissionDate;
@property(nonatomic,copy) NSString *doctorName;
@property(nonatomic,copy) NSString *condition;
@property(nonatomic,copy) NSString *nursingLevel;
@property(nonatomic,copy) NSString *type;
@property(nonatomic,copy) NSString *diagnosis;
@property(nonatomic,copy) NSString *bedNumber;
@property(nonatomic,strong) NSDictionary *details;


@end

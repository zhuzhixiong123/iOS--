//
//  ZXKeShiModel.h
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/26.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXKeShiModel : NSObject

@property(nonatomic,copy) NSString *userId;
@property(nonatomic,copy) NSString *loginId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *role;
@property(nonatomic,strong) NSDictionary *department;
@property(nonatomic,copy) NSString *managedDepartments;
@property(nonatomic,strong) NSArray *accessibleDepartments;

@end

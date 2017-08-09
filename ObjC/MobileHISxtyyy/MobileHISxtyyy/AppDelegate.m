//
//  AppDelegate.m
//  MobileHISxtyyy
//
//  Created by 志雄 朱 on 2017/7/24.
//  Copyright © 2017年 志雄 朱. All rights reserved.
//

#import "AppDelegate.h"
#import "HMTabbarController.h"

#import "ZXLoginController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HMTabbarController *Vc = [[HMTabbarController alloc] init];
    [self.window setRootViewController:Vc];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
 
}


- (void)applicationDidEnterBackground:(UIApplication *)application {

    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
 
}


@end

//
//  AppDelegate.m
//  TXBYModuleApp
//
//  Created by YandL on 16/10/20.
//  Copyright © 2016年 YandL. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    TXBYTabBarController *tab = [[TXBYTabBarController alloc] init];
    // Tabbar背景色
    tab.backgroundColor = [UIColor whiteColor];
    // Tabbar标题颜色
    tab.titleColor = TXBYColor(82, 82, 82);
    // 标题选中的颜色
    tab.selectedTitleColor = TXBYColor(31, 183, 231);
    // 导航栏的颜色
    tab.navigationController.navigationBarBarTintColor = ESMainColor;
    tab.navigationController.barButtonItemColor = [UIColor whiteColor];
    tab.navigationController.barButtonItemFont = [UIFont systemFontOfSize:16];
    tab.navigationController.navigationBarTintColor = [UIColor whiteColor];
    // 导航栏的标题颜色
    tab.navigationController.navigationBarTitleColor = [UIColor whiteColor];
    
    // 1. 首页
    ViewController *home = [[ViewController alloc] init];
    home.fileName = @"HomeItem.plist";
    [tab addChildViewController:home title:@"首页" imageName:@"home"];
    
    // 1. 首页
    ViewController *alipay = [[ViewController alloc] init];
    alipay.fileName = @"Alipay.plist";
    [tab addChildViewController:alipay title:@"支付宝" imageName:@"home"];
    
    self.window.rootViewController = tab;
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

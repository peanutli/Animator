//
//  AppDelegate.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "LDCBaseNavigationController.h"
#import "LDCTabBarController.h"

@interface AppDelegate ()

@property (nonatomic,strong)LDCTabBarController * tabBarController;

@end

@implementation AppDelegate

- (void)setUpChildViewControllers{
    FirstViewController * firstVC = [[FirstViewController alloc]init];
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    _tabBarController = [[LDCTabBarController alloc]init];
    [_tabBarController setupTabBarItemWithChildVC:firstVC image:@"home" selectImage:@"home_sel"];
    [_tabBarController setupTabBarItemWithChildVC:secondVC image:@"shelf" selectImage:@"shelf_sel"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setUpChildViewControllers];
    self.window.rootViewController = _tabBarController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

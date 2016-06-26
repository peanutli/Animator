//
//  LDCTabBarController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCTabBarController.h"
#import "LDCBaseNavigationController.h"
#import "UIImage+LDC.h"
#import "LDCEssenceViewController.h"
#import "LDCNewViewController.h"
#import "LDCAttentionViewController.h"
#import "LDCMineViewController.h"
#import "LDCTabBar.h"

@interface LDCTabBarController ()

@end

@implementation LDCTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewControllers];
    [self setValue:[[LDCTabBar alloc]init] forKeyPath:@"tabBar"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- priviate method
- (void)setUpChildViewControllers{
    LDCEssenceViewController * essenceVC = [[LDCEssenceViewController alloc]init];
    LDCNewViewController * newVC = [[LDCNewViewController alloc]init];
    LDCAttentionViewController * attentionVC = [[LDCAttentionViewController alloc]init];
    LDCMineViewController * mineVC = [[LDCMineViewController alloc]init];
    [self setupTabBarItemWithChildVC:essenceVC title:@"精华" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    [self setupTabBarItemWithChildVC:newVC title:@"新帖" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    [self setupTabBarItemWithChildVC:attentionVC title:@"关注" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    [self setupTabBarItemWithChildVC:mineVC title:@"我的" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
}

-(void)setupTabBarItemWithChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImageName{
    UIViewController * viewController = vc;
    LDCBaseNavigationController * nav = [[LDCBaseNavigationController alloc]initWithRootViewController:viewController];
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageWithRenderingModeAlwaysOriginal:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageWithRenderingModeAlwaysOriginal:selectImageName];
    
    [self setupTitleColorWithChildVC:vc color:[UIColor grayColor] state:UIControlStateNormal];
    [self setupTitleColorWithChildVC:vc color:[UIColor blackColor] state:UIControlStateHighlighted];
    [self addChildViewController:nav];
}

- (void)setupTitleColorWithChildVC:(UIViewController *)vc color:(UIColor *)color state:(UIControlState)state{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    dic[NSForegroundColorAttributeName] = color;
    [vc.tabBarItem setTitleTextAttributes:dic forState:state];
}



@end

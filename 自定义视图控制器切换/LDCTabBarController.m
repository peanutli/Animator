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

@interface LDCTabBarController ()

@end

@implementation LDCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"user_sel"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTabBarItemWithChildVC:(UIViewController *)vc image:(NSString *)imageName selectImage:(NSString *)selectImageName{
    
    UIViewController * viewController = vc;
    LDCBaseNavigationController * nav = [[LDCBaseNavigationController alloc]initWithRootViewController:viewController];
    viewController.tabBarItem.image = [UIImage imageWithRenderingModeAlwaysOriginal:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageWithRenderingModeAlwaysOriginal:selectImageName];
    
    [self setupTitleColorWithChildVC:vc color:[UIColor grayColor] state:UIControlStateNormal];
    [self setupTitleColorWithChildVC:vc color:[UIColor redColor] state:UIControlStateHighlighted];
    //self.tabBar.backgroundColor = [UIColor orangeColor];
  
    
    [self addChildViewController:nav];
}

- (void)setupTitleColorWithChildVC:(UIViewController *)vc color:(UIColor *)color state:(UIControlState)state{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    dic[NSForegroundColorAttributeName] = color;
    [vc.tabBarItem setTitleTextAttributes:dic forState:state];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

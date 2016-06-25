//
//  LDCTabBarController.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDCTabBarController : UITabBarController

- (void)setupTabBarItemWithChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImageName;

@end

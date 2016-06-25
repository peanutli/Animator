//
//  LDCBaseNavigationController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/24.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCBaseNavigationController.h"

@interface LDCBaseNavigationController ()

@end

@implementation LDCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    for (UIView * view in self.view.subviews){
//        if ([view isKindOfClass:[UIBarButtonItem class]]) {
//            view.frame = CGRectMake(-100, 0, view.frame.size.width, view.frame.size.height);
//        }
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

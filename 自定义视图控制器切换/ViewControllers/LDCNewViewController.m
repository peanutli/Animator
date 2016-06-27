//
//  LDCNewViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCNewViewController.h"
#import "UIBarButtonItem+LDC.h"
#import "LDCNewDetailViewController.h"


@interface LDCNewViewController ()

@end

@implementation LDCNewViewController

- (void)setStep{
    [super setStep];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"MainTagSubIcon" selecImage:@"MainTagSubIconClick" target:self selector:@selector(pushNewDetailVC)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWith:@"mine-setting-icon" selecImage:@"mine-setting-icon-click" target:self selector:@selector(customSettingMehtod)];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark--privateMethod
- (void)pushNewDetailVC{
    LDCNewDetailViewController * newDetailVC = [[LDCNewDetailViewController alloc]init];
    [self.navigationController pushViewController:newDetailVC animated:YES];
}

- (void)customSettingMehtod{
    NSLog(@"自定义设置");
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

//
//  LDCMineViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//  我

#import "LDCMineViewController.h"
#import "UIBarButtonItem+LDC.h"
#import "LDCRecommendTag.h"
#import "LDCTagViewCell.h"

@interface LDCMineViewController ()

@end

@implementation LDCMineViewController

/**
 *配置tableview控件
 */
- (void)setupTableView{
    
}

- (void)setStep{
    [super setStep];
    UIBarButtonItem * moonButtonItem = [UIBarButtonItem barButtonItemWith:@"mine-moon-icon" selecImage:@"mine-moon-icon-click" target:self selector:nil];
    UIBarButtonItem * settingButtonItem = [UIBarButtonItem barButtonItemWith:@"mine-setting-icon" selecImage:@"mine-setting-icon-click" target:self selector:nil];
    self.navigationItem.rightBarButtonItems = @[settingButtonItem,moonButtonItem];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

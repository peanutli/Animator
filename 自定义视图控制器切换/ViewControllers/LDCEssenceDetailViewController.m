//
//  LDCEssenceDetailViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/26.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCEssenceDetailViewController.h"

@interface LDCEssenceDetailViewController ()

@end

@implementation LDCEssenceDetailViewController

- (void)setStep{
    [super setStep];
    self.navigationItem.title = @"详情";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--privateMethod

- (void)backVC{
    [self.navigationController popViewControllerAnimated:YES];
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

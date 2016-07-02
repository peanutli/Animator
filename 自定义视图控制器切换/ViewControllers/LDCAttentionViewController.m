//
//  LDCAttentionViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCAttentionViewController.h"
#import "UIBarButtonItem+LDC.h"
#import "LDCRecommendViewController.h"
#import "LDCUserLogRegisterController.h"

@interface LDCAttentionViewController ()

@end

@implementation LDCAttentionViewController

- (void)setStep{
    [super setStep];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"friendsRecommentIcon" selecImage:@"friendsRecommentIcon-click" target:self selector:@selector(recommendClicked)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWith:@"friendsRecommentIcon" selecImage:@"friendsRecommentIcon-click" target:self selector:@selector(userRegister)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark--private Method
- (void)recommendClicked{
    LDCRecommendViewController * recommendVC = [[LDCRecommendViewController alloc]init];
    [self.navigationController pushViewController:recommendVC animated:YES];
}

- (void)userRegister{
    LDCUserLogRegisterController * logAndRgisterVC = [[LDCUserLogRegisterController alloc]init];
    [self presentViewController:logAndRgisterVC animated:YES completion:nil];
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

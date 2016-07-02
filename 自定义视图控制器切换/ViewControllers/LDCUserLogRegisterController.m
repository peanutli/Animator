//
//  LDCUserLogRegisterController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/7/1.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCUserLogRegisterController.h"

@interface LDCUserLogRegisterController ()

@end

@implementation LDCUserLogRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtn:(id)sender {
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerBtn:(id)sender {
    LDCLog(@"registerBtn");
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

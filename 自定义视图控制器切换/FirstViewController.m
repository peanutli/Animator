//
//  FirstViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "PushAnimated.h"
#import "PopAnimated.h"

@interface FirstViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@end

@implementation FirstViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.title = @"FirstVC";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    self.view.backgroundColor = [UIColor grayColor];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"进入下一个控制器" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(transitionVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--privateMethod
- (void)transitionVC{
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mark --NavgationControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return [PushAnimated new];
      //  return [PushAnimator new];
    }
    else if (operation == UINavigationControllerOperationPop){
        return [PopAnimated new];
       // return [PopAnimator new];
    }
    else {
        return nil;
    }
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

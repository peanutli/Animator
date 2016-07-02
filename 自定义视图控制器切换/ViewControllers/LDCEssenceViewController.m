//
//  LDCEssenceViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCEssenceViewController.h"
#import "UIBarButtonItem+LDC.h"
#import "LDCEssenceTagViewController.h"
#import "LDCKVONotifiyingPerson.h"
#import "NSObject+KVO.h"
#import "Person.h"

@interface LDCEssenceViewController ()

@property (nonatomic,strong) Person * p;

@end

@implementation LDCEssenceViewController

- (void)setStep{
    [super setStep];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:@"MainTagSubIcon" selecImage:@"MainTagSubIconClick" target:self selector:@selector(essenceDetailVC)];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
//    Person * person = [[Person alloc]init];
//    person.name = @"李大川";
//    [person ldc_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    person.name = @"刘任鹏";
//    [person removeObserver:self forKeyPath:@"name"];
    Person * person = [[Person alloc]init];
    _p = person;
    person.name = @"李大川";
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    person.name = @"刘仁鹏";
    [person removeObserver:self forKeyPath:@"name"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@",_p.name);
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

- (void)essenceDetailVC{
    LDCEssenceTagViewController * tagVC = [[LDCEssenceTagViewController alloc]init];
    [self.navigationController pushViewController:tagVC animated:YES];
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

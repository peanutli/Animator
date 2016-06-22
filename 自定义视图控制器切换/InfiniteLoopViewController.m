//
//  InfiniteLoopViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "InfiniteLoopViewController.h"
#import "ImageModel.h"
#import "InfiniteLoopViewBuilder.h"
#import "UIView+SetRect.h"
#import "LoopViewCell.h"
#import "NSObject+Manger.h"
#import "Person.h"
//#import "NSObject+KVO.h"
#import "Calculator.h"

@interface InfiniteLoopViewController ()

@property (nonatomic,strong) Person * p;

@end

@implementation InfiniteLoopViewController

- (void)setStep{
    [super setStep];
  // 链式编程思想
   NSInteger result0 =[NSObject Calculator:^(CalculatorManger * manger) {
       manger.add(6).add(12).add(2);
   }];
    
    NSLog(@"%ld",result0);
    
    //响应式编程思想
    
//     _p = [[Person alloc]init];
//    _p.name = @"hello";
//    [_p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    _p.name = @"world";
//    
//    [_p removeObserver:self forKeyPath:@"name"];
    
//    _p = [[Person alloc]init];
//    _p.name = @"hello";
//    [_p ldc_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    _p.name = @"world";
    
    //函数式编程 一个操作，执行一系列的方法。
    
    
    Calculator * calcutator = [[Calculator alloc]init];
    int result = [calcutator add:^int(int result) {
        result += 10;
        result +=100;
        NSLog(@"%d",result);
        return result;
    }].result;
    NSLog(@"%d",result);
    
    BOOL isEqual = [[calcutator add:^int(int result) {
        result += 10;
        result += 100;
        return result;
    }]equal:^BOOL(int result) {
        return result == 220;
    }].isEqual;
    NSLog(@"=====%d",isEqual);
    
    NSArray *strings = @[@"http://img.wdjimg.com/image/video/d999011124c9ed55c2dd74e0ccee36ea_0_0.jpeg",
                         @"http://img.wdjimg.com/image/video/2ddcad6dcc38c5ca88614b7c5543199a_0_0.jpeg",
                         @"http://img.wdjimg.com/image/video/6d6ccfd79ee1deac2585150f40915c09_0_0.jpeg",
                         @"http://img.wdjimg.com/image/video/2111a863ea34825012b0c5c9dec71843_0_0.jpeg",
                         @"http://img.wdjimg.com/image/video/b4085a983cedd8a8b1e83ba2bd8ecdd8_0_0.jpeg",
                         @"http://img.wdjimg.com/image/video/2d59165e816151350a2b683b656a270a_0_0.jpeg",
                         @"http://img.wdjimg.com/image/video/dc2009ee59998039f795fbc7ac2f831f_0_0.jpeg"];
    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i < strings.count; i++) {
        [models addObject:[ImageModel imageModelWithImageUrl:strings[i]]];
    }
    
    InfiniteLoopViewBuilder * loopView = [[InfiniteLoopViewBuilder alloc]initWithFrame:CGRectMake(0, 0,Width, self.view.frame.size.width/2)];
    loopView.customClass = [LoopViewCell class];
    loopView.models = (NSArray<InfiniteLoopViewProtocol> *)models;
    [loopView startLoopAnimated:YES];
    [self.view addSubview:loopView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@",_p.name);
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

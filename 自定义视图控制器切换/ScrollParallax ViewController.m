//
//  ScrollParallax ViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/21.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "ScrollParallax ViewController.h"
#import "Math.h"
#import "UIView+SetRect.h"
#import "MoreInfoView.h"
#import "CalculatorMaker.h"
#import "NSObject+Calculator.h"
static NSInteger type = 0;
static NSInteger kPictureTag = 2000;

@interface ScrollParallaxViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) Math * onceLinearEquation;
@property (nonatomic,strong) NSArray * picturesArray;

@end

@implementation ScrollParallaxViewController

- (void)setStep{
    [super setStep];
    
    //链式编程思想 加法计算器使用block的 make.add(4).add(6)
    
    NSInteger result =  [NSObject makeCalculator:^(CalculatorMaker *maker) {
        maker.add(6).add(10).multiplication(5);
    }];
    NSLog(@"%ld",result);

    
    MATPoint pointA;
    MATPoint pointB;
    
    if (type % 4 == 0) {
        pointA = MATPointMake(0, -50);
        pointB = MATPointMake(self.view.width, 270-80);
    }
    type++;
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    self.onceLinearEquation = [Math mathOnceLineEquationWihtPointA:pointA PointB:pointB];
    self.picturesArray = @[[UIImage imageNamed:@"0"],
                           [UIImage imageNamed:@"1"],
                           [UIImage imageNamed:@"2"],
                           [UIImage imageNamed:@"3"]];
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.bounces = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(width*4, height);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    for (NSInteger i = 0; i < self.picturesArray.count; i++) {
        MoreInfoView * show = [[MoreInfoView alloc]initWithFrame:CGRectMake(i*width, 0, width, height)];
        show.imageView.image = self.picturesArray[i];
        show.tag = kPictureTag + i;
        [_scrollView addSubview:show];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    for (NSInteger i = 0; i < self.picturesArray.count; i++) {
        MoreInfoView * show = [scrollView viewWithTag:kPictureTag + i];
        show.imageView.x = _onceLinearEquation.k * (offSetX - i*self.view.width) + _onceLinearEquation.b;
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

//
//  SpringScaleViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/17.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "SpringScaleViewController.h"
#import "UIView+SetRect.h"
#import "UIFont+Fonts.h"
#import "POP.h"
#import "GCDQueue.h"

static NSString * kScaleAnimation = @"scaleAnimation";
static NSString * kSpringAnimation = @"springAnimation";
@interface SpringScaleViewController ()<POPAnimationDelegate>

@property (nonatomic,strong)UIView * scaleView;

@end

@implementation SpringScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * popLabel = [[UILabel alloc]init];
    popLabel.text= @"大川    花生";
    popLabel.font = [UIFont AvenirWithFontSize:60];
    popLabel.textColor = [UIColor greenColor];
    [self.view addSubview:popLabel];
    [popLabel sizeToFit];
    popLabel.center = self.view.middlePoint;
    
    self.scaleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    self.scaleView.backgroundColor = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    [self.view addSubview:self.scaleView];
    self.scaleView.layer.cornerRadius = self.scaleView.width/2;
    self.scaleView.center = self.view.middlePoint;
    
    [GCDQueue executedInMainQueue:^{
        [self scaleAnimation];
    } afterDelaySecs:1.0f];
    
    // Do any additional setup after loading the view.
}

- (void)scaleAnimation{
    POPBasicAnimation * scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleAnimation.duration = 0.15f;
    scaleAnimation.name = kScaleAnimation;
    scaleAnimation.delegate = self;
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5f, 1.5f)];
    [self.scaleView pop_addAnimation:scaleAnimation forKey:nil];
}

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished{
    if ([anim.name isEqualToString:kScaleAnimation]) {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.name = kSpringAnimation;
        springAnimation.delegate = self;
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.f, 1.f)];
        [self.scaleView pop_addAnimation:springAnimation forKey:nil];
    }
    else if ([anim.name isEqualToString:kSpringAnimation]){
        [self performSelector:@selector(scaleAnimation) withObject:nil afterDelay:1.f];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    
     //[[self class] cancelPreviousPerformRequestsWithTarget:self];
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

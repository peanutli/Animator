//
//  ScrollViewAnimationController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/18.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "ScrollViewAnimationController.h"
#import "UIView+SetRect.h"
#import "ScrollViewComputingAlphaValue.h"

static NSInteger kPittureTag = 2000;

@interface ScrollViewAnimationController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,copy)NSArray * pictures;
@property (nonatomic,strong)NSMutableArray * computAlphaValue;

@end
@implementation ScrollViewAnimationController

- (void)setStep{
    self.scrollView = [[UIScrollView alloc]initWithFrame:ScreenFrame];
    self.scrollView.contentSize = CGSizeMake(Width * 3, Height);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    self.computAlphaValue = [[NSMutableArray alloc]init];
    
    for (NSInteger  i = 0; i<3; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, Height)];
        imageView.tag = kPittureTag + i;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",i]];
        [self.view addSubview:imageView];
        ScrollViewComputingAlphaValue * alphaValue = [[ScrollViewComputingAlphaValue alloc]init];
        alphaValue.startValue = -Width + Width * i;
        alphaValue.midValue = 0 + Width * i;
        alphaValue.endValue = Width + Width * i;
        [alphaValue makeLineEquation];
        [self.computAlphaValue addObject:alphaValue];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSet = scrollView.contentOffset.x;
    for (NSInteger i = 0; i<3; i++) {
        UIImageView * imageView = [self.view  viewWithTag:(kPittureTag + i)];
        ScrollViewComputingAlphaValue * alphaValue = _computAlphaValue[i];
        alphaValue.inputValue = offSet;
        imageView.alpha = alphaValue.outputValue;
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

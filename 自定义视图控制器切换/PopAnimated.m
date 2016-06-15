//
//  PopAnimated.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "PopAnimated.h"
#import "UIView+SetRect.h"
@implementation PopAnimated

- (void)transitionAnimate{
   [self.containerView insertSubview:self.toViewController.view belowSubview:self.fromViewController.view];
    [UIView animateWithDuration:self.transitionDuration delay:0.1f options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        self.toViewController.view.alpha = 1.f;
        self.fromViewController.view.x = Width;
    } completion:^(BOOL finished) {
        [self transitionCompleted];
    }];

}

@end

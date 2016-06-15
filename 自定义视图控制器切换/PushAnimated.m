//
//  PushAnimated.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "PushAnimated.h"
#import "UIView+SetRect.h"
@implementation PushAnimated

- (void)transitionAnimate{
    [self.containerView addSubview:self.toViewController.view];
    self.toViewController.view.x = Width;
    [UIView animateWithDuration:self.transitionDuration delay:0.1f options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        self.fromViewController.view.alpha = 0.f;
        self.toViewController.view.x = 0.f;
    } completion:^(BOOL finished) {
        [self transitionCompleted];
    }];
}

@end

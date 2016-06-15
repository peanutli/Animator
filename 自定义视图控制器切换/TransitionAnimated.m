//
//  TransitionAnimated.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "TransitionAnimated.h"

@interface TransitionAnimated()

@property (nonatomic,weak) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation TransitionAnimated

- (instancetype)init{
    self = [super init];
    if (self) {
        self.transitionDuration = 5.5f;
    }
    return self;
}

- (void)transitionAnimate{
    
}

- (void)transitionCompleted{
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

#pragma mark--UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return self.transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.transitionContext = transitionContext;
    self.containerView = [transitionContext containerView];
    [self transitionAnimate];
}

- (void)animationEnded:(BOOL) transitionCompleted{
    NSLog(@"完成");
}

@end

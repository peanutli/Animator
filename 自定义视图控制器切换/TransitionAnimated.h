//
//  TransitionAnimated.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionAnimated : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic,weak) UIViewController * fromViewController;
@property (nonatomic,weak) UIViewController * toViewController;
@property (nonatomic,assign) NSTimeInterval  transitionDuration;
@property (nonatomic,weak) UIView * containerView;
- (void)transitionAnimate;
- (void)transitionCompleted;
@end

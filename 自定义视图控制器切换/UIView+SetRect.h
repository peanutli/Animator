//
//  UIView+SetRect.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Width  [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define ScreenFrame  [UIScreen mainScreen].bounds
@interface UIView (SetRect)
@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGPoint middlePoint;
@property (nonatomic,assign)CGSize size;
@end

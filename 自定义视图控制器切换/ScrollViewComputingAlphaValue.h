//
//  ScrollViewComputingAlphaValue.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/18.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScrollViewComputingAlphaValue : NSObject

@property (nonatomic,assign) CGFloat startValue;
@property (nonatomic,assign) CGFloat midValue;
@property (nonatomic,assign) CGFloat endValue;
@property (nonatomic,assign) CGFloat inputValue;
@property (nonatomic,assign) CGFloat outputValue;
- (void)makeLineEquation;
@end

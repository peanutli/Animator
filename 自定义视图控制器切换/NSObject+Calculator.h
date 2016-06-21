//
//  NSObject+Calculator.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/21.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorMaker.h"

@interface NSObject (Calculator)

+ (NSInteger)makeCalculator:(void (^)(CalculatorMaker * maker))block;

@end

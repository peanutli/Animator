//
//  NSObject+Calculator.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/21.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "NSObject+Calculator.h"

@implementation NSObject (Calculator)

+(NSInteger)makeCalculator:(void (^)(CalculatorMaker * ))block{
   // return maker.result;
    CalculatorMaker * maker = [[CalculatorMaker alloc]init];
    block(maker);
    return maker.result;
}

@end

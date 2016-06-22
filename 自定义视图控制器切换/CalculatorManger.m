//
//  CalculatorManger.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "CalculatorManger.h"

@implementation CalculatorManger

-(CalculatorManger * (^)(NSInteger num))add{
    return ^(NSInteger num){
        _result += num;
        return self;
    };
}


@end

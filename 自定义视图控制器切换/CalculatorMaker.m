//
//  CalculatorMaker.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/21.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

- (instancetype)add:(NSInteger)num{
    _result += num;
    return self;
}
-(void (^)(void))addValue{
    return ^{};
}
- (CalculatorMaker *(^)(NSInteger num))add{
    return ^(NSInteger num){
        _result += num;
        return self;
    };
}

-(CalculatorMaker *(^)(NSInteger num))multiplication{
    return ^(NSInteger num){
        _result *= num;
        return self;
    };
}


@end

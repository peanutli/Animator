//
//  NSObject+Manger.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "NSObject+Manger.h"

@implementation NSObject (Manger)

+ (NSInteger)Calculator:(void (^)(CalculatorManger * ))block{
    CalculatorManger * manger = [[CalculatorManger alloc]init];
    block(manger);
    return manger.result;
}

@end

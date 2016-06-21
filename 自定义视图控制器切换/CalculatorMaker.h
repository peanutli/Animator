//
//  CalculatorMaker.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/21.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorMaker : NSObject

@property (nonatomic,assign) NSInteger result;

- (instancetype)add:(NSInteger)num;

- (void (^)(void))addValue;
- (CalculatorMaker * (^)(NSInteger num))add;
- (CalculatorMaker *(^)(NSInteger num))multiplication;

@end

//
//  CalculatorManger.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorManger : NSObject

@property (nonatomic,assign) NSInteger result;
- (CalculatorManger *(^)(NSInteger num))add;
@end

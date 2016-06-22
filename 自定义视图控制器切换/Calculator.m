//
//  Calculator.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (instancetype)init{
    self = [super init];
    if (self) {
        _result = 0;
    }
    return self;
}

- (instancetype)add:(int (^)(int))block{
    _result = block(_result);
    return self;
}

- (instancetype)equal:(BOOL (^)(int))block{
    _isEqual = block(_result);
    NSLog(@"%d",_isEqual);
    return self;
}
@end

//
//  ScrollViewComputingAlphaValue.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/18.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "ScrollViewComputingAlphaValue.h"
#import "Math.h"

@interface ScrollViewComputingAlphaValue ()

@property (nonatomic,strong)Math *frontLine;
@property (nonatomic,strong)Math *backLine;

@end

@implementation ScrollViewComputingAlphaValue

- (void)makeLineEquation{
    self.frontLine = [Math mathOnceLineEquationWihtPointA:MATPointMake(_startValue, 0) PointB:MATPointMake(_midValue, 1)];
    self.backLine = [Math mathOnceLineEquationWihtPointA:MATPointMake(_midValue, 1) PointB:MATPointMake(_endValue, 0)];
    
}

- (void)setInputValue:(CGFloat)inputValue{
    _inputValue = inputValue;
    if (inputValue <= _startValue) {
        _outputValue = 0.f;
    }
    else if (inputValue <= _midValue){
        _outputValue = _frontLine.k * inputValue + _frontLine.b;
    }
    else if (inputValue <= _endValue){
        _outputValue = _backLine.k * inputValue + _backLine.b;
    }
    else{
        _outputValue = 0.f;
    }
}

@end

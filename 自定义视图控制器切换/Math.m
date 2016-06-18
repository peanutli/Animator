//
//  Math.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/18.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "Math.h"

@implementation Math

CGFloat computeK(CGFloat x1,CGFloat y1,CGFloat x2,CGFloat y2){
    if (x2 == x1){
        return 0;
    }
    return (y2 - y1) / (x2 - x1);
}

CGFloat computeB(CGFloat x1,CGFloat y1,CGFloat x2,CGFloat y2){
    if (x2 == x1){
        return 0;
    }
    return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1);
}

+ (instancetype)mathOnceLineEquationWihtPointA:(MATPoint)pointA PointB:(MATPoint)pointB{
    Math * equation = [[Math alloc]init];
    CGFloat x1 = pointA.x;
    CGFloat y1 = pointA.y;
    CGFloat x2 = pointB.x;
    CGFloat y2 = pointB.y;
    equation.k = computeK(x1, y1, x2, y2);
    equation.b = computeB(x1, y1, x2, y2);
    return equation;
}

@end

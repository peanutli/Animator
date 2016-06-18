//
//  Math.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/18.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct MATPoint {
    CGFloat x;
    CGFloat y;
};
typedef struct MATPoint MATPoint;

static inline MATPoint MATPointMake(CGFloat x,CGFloat y){
    MATPoint p;
    p.x = x;
    p.y = y;
    return p;
}

@interface Math : NSObject

@property (nonatomic,assign)CGFloat k;
@property (nonatomic,assign)CGFloat b;

+ (instancetype)mathOnceLineEquationWihtPointA:(MATPoint)pointA PointB:(MATPoint)pointB;

@end

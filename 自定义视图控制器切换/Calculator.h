//
//  Calculator.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic,assign)int result;
@property (nonatomic,assign)BOOL isEqual;

- (instancetype)add:(int(^)(int result))block;

- (instancetype)equal:(BOOL(^)(int result))block;

@end

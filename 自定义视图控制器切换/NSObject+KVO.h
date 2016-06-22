//
//  NSObject+KVO.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)ldc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;


@end

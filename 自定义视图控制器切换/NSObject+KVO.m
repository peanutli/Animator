//
//  NSObject+KVO.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "NSObject+KVO.h"
#import "LDCKVONotifiyingPerson.h"
#import <objc/runtime.h>

@implementation NSObject (KVO)

- (void)ldc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    object_setClass(self, [LDCKVONotifiyingPerson class]);
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

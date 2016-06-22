//
//  LDCKVONotifiyingPerson.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/22.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCKVONotifiyingPerson.h"
#import <objc/runtime.h>

@implementation LDCKVONotifiyingPerson

- (void)setName:(NSString *)name{
    [super setName:name];
    //通知观察者，改变属性
    id observer = objc_getAssociatedObject(self, @"observer");
    [observer observeValueForKeyPath:@"name" ofObject:nil change:nil context:nil];
}

@end

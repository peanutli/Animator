//
//  GCDQueue.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/16.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "GCDQueue.h"
static GCDQueue * mainQueue;
static GCDQueue * globalQueue;

@interface GCDQueue ()
@property (nonatomic,readwrite,strong) dispatch_queue_t disaptchQueue;
@end

@implementation GCDQueue

+ (void)initialize{
    if (self == [GCDQueue self]) {
        mainQueue = [GCDQueue new];
        globalQueue = [GCDQueue new];
        mainQueue.disaptchQueue = dispatch_get_main_queue();
        globalQueue.disaptchQueue = dispatch_get_global_queue(0, 0);
    }
}

+ (void)executedInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*sec),mainQueue.disaptchQueue, block);
}

+ (void)executedInGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalQueue.disaptchQueue, block);
}


@end

//
//  GCDQueue.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/16.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDQueue : NSObject

@property (nonatomic,readonly,strong) dispatch_queue_t dispatchQueue;
+ (void)executedInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;
+ (void)executedInGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;

@end

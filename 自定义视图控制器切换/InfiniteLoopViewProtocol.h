//
//  InfiniteLoopViewProtocol.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol InfiniteLoopViewProtocol <NSObject>

@required

- (id)dataObject;
- (NSString *)imageUrlString;

@end

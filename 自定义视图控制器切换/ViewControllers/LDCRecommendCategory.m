//
//  LDCRecommendCategory.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/29.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCRecommendCategory.h"

@implementation LDCRecommendCategory

- (NSArray<LDCRecommendUser *> *)recommendUsers{
    if (!_recommendUsers) {
        _recommendUsers = [[NSMutableArray alloc]init];
    }
    return _recommendUsers;
}

@end

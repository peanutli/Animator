//
//  LDCRecommendCategory.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/29.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDCRecommendUser.h"

@interface LDCRecommendCategory : NSObject

@property (nonatomic,assign) NSInteger id;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,copy) NSString * name;

@property (nonatomic,strong)NSMutableArray<LDCRecommendUser*> * recommendUsers;
@property (nonatomic,assign)NSInteger total;
@property (nonatomic,assign)NSInteger currentPage;

@end

//
//  LDCRecommendTag.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/30.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDCRecommendTag : NSObject

@property (nonatomic,copy) NSString *image_list;
@property (nonatomic,assign) BOOL is_default;
@property (nonatomic,assign) BOOL is_sub;
@property (nonatomic,assign) NSInteger sub_number;
@property (nonatomic,assign) NSInteger theme_id;
@property (nonatomic,copy) NSString * theme_name;

@end

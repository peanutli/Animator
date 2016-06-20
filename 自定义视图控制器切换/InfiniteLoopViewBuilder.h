//
//  InfiniteLoopViewBuilder.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteLoopViewProtocol.h"

@interface InfiniteLoopViewBuilder : UIView

@property (nonatomic)Class customClass;
@property (nonatomic)NSTimeInterval  scrollViewTimeInterVal;
@property (nonatomic)UICollectionViewScrollDirection  scrollDirection;
@property (nonatomic,strong)NSArray <InfiniteLoopViewProtocol> *models;

- (void)startLoopAnimated:(BOOL)animated;

@end

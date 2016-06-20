//
//  InfiniteLoopView.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteLoopViewProtocol.h"
#import "CustomInfiniteLoopViewCell.h"

@interface InfiniteLoopView : UIView

@property (nonatomic,assign)NSTimeInterval  scrollTimerInterval;
@property (nonatomic)Class customClass;
@property (nonatomic)UICollectionViewScrollDirection scrollDirection;
@property (nonatomic,strong)NSArray <InfiniteLoopViewProtocol>*models;
@property (nonatomic,readonly)NSInteger currentPage;

- (void)reset;
- (void)perpare;
- (void)startLoopAnimation;
- (void)stopLoopAnimation;
@end

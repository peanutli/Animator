//
//  InfiniteLoopViewBuilder.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "InfiniteLoopViewBuilder.h"
#import "InfiniteLoopView.h"

@interface InfiniteLoopViewBuilder ()

@property (nonatomic,strong) InfiniteLoopView * loopView;

@end

@implementation InfiniteLoopViewBuilder

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.scrollViewTimeInterVal = 4.f;
        
        //init loopView
        self.loopView = [[InfiniteLoopView alloc]initWithFrame:self.bounds];
        [self addSubview:self.loopView];
    }
    return self;
}

- (void)startLoopAnimated:(BOOL)animated{
    [self.loopView reset];
    self.loopView.customClass = self.customClass;
    self.loopView.models = self.models;
    self.loopView.scrollDirection = self.scrollDirection;
    self.loopView.scrollTimerInterval = self.scrollDirection;
    [self.loopView perpare];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

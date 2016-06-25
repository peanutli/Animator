//
//  LDCTabBar.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCTabBar.h"
#import "UIView+SetRect.h"
@interface LDCTabBar()

@property (nonatomic,strong)UIButton * pushButton;

@end

@implementation LDCTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.pushButton = [[UIButton alloc]init];
        [self.pushButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.pushButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:self.pushButton];
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger i = 0;
    CGFloat itemY = 0;
    CGFloat itemWidth = self.width /5.f;
    CGFloat itemHeiht = self.height;
    self.pushButton.frame = CGRectMake(0, 0, itemWidth, itemHeiht);
    self.pushButton.center = CGPointMake(self.width*0.5, self.height*0.5);
    for (UIView * view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]]||view == self.pushButton) continue;
        
        CGFloat width = itemWidth * ((i>1)?(i+1):(i));
        view.frame = CGRectMake(width, itemY, itemWidth, itemHeiht);
        i++;
        
    }
}

@end

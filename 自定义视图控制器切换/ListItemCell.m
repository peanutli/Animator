//
//  ListItemCell.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/17.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "ListItemCell.h"
#import "POP.h"

@implementation ListItemCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted: highlighted animated:animated];
    if (highlighted) {
        POPBasicAnimation * scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        //scaleAnimation.duration = 0.1f;
      //  scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
    else{
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];

    }
}

@end

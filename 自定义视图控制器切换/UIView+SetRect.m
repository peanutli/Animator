//
//  UIView+SetRect.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "UIView+SetRect.h"

@implementation UIView (SetRect)

- (void)setX:(CGFloat)x{
    CGRect newFrame = self.frame;
    newFrame.origin.x = x;
    self.frame = newFrame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}
@end

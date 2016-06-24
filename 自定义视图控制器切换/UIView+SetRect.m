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

- (CGFloat)width{
    return CGRectGetWidth(self.bounds);
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (CGPoint)middlePoint{
    return CGPointMake(CGRectGetWidth(self.bounds)/2.f, CGRectGetHeight(self.bounds)/2.f);
}

- (void)setSize:(CGSize)size{
    CGRect newFrame = self.frame;
    newFrame.size.width = size.width;
    newFrame.size.height = size.height;
    self.frame = newFrame;
}

@end

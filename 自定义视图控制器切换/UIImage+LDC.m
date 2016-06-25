//
//  UIImage+LDC.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/25.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "UIImage+LDC.h"

@implementation UIImage (LDC)

+ (UIImage *)imageWithRenderingModeAlwaysOriginal:(NSString *)imageName{
    UIImage * imageOriginal = [UIImage imageNamed:imageName];
    imageOriginal = [imageOriginal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return imageOriginal;
}

@end

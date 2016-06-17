//
//  UIFont+Fonts.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/17.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "UIFont+Fonts.h"

@implementation UIFont (Fonts)

+ (UIFont *)HYQiHeiWithFontSize:(CGFloat)size{
    
    return [UIFont fontWithName:@"HYQiHei-BEJF" size:size];
}

+ (UIFont *)AvenirWithFontSize:(CGFloat)size{
    return [UIFont fontWithName:@"Avenir" size:size];
}

@end

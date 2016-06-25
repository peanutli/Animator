//
//  UIBarButtonItem+LDC.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/24.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "UIBarButtonItem+LDC.h"
#import "UIView+SetRect.h"

@implementation UIBarButtonItem (LDC)

+(instancetype)barButtonItemWith:(NSString *)image selecImage:(NSString *)selecImage target:(id)target selector:(SEL)sel{
    UIButton * barButton = [[UIButton alloc]init];
    [barButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [barButton setBackgroundImage:[UIImage imageNamed:selecImage] forState:UIControlStateHighlighted];
    [barButton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    barButton.size = [barButton currentBackgroundImage].size;
    return [[self alloc]initWithCustomView:barButton];
}

+ (instancetype)barButtonItemWith:(NSString *)image selecImage:(NSString *)selecImage target:(id)target selector:(SEL)sel state:(UIControlState)state{
    UIButton * barButton = [[UIButton alloc]init];
    [barButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [barButton setBackgroundImage:[UIImage imageNamed:selecImage] forState:state];
    [barButton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    barButton.size = [barButton currentBackgroundImage].size;
    return [[self alloc]initWithCustomView:barButton];
}

@end

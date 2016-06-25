//
//  UIBarButtonItem+LDC.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/24.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LDC)

+ (instancetype)barButtonItemWith:(NSString *)image selecImage:(NSString *)selecImage target:(id)target selector:(SEL)sel;
+ (instancetype)barButtonItemWith:(NSString *)image selecImage:(NSString *)selecImage target:(id)target selector:(SEL)sel state:(UIControlState)state;

@end

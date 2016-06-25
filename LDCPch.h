//
//  LDCPch.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/24.
//  Copyright © 2016年 花生. All rights reserved.
//

#ifndef LDCPch_h
#define LDCPch_h

#ifdef DEBUG
#define LDCLog(...) NSLog(__VA_ARGS__)
#else
#define LDCLog(...)
#endif

#define LDCRGBColor(a,b,c) [UIColor colorWithRed:(a)/255.f green:(b)/255.f blue:(c)/255.f alpha:1.0];
#define LDCGlobalBackgroundColor LDCRGBColor(233,233,233);

#endif /* LDCPch_h */

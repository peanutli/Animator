//
//  ImageModel.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfiniteLoopViewProtocol.h"

@interface ImageModel : NSObject<InfiniteLoopViewProtocol>

@property (nonatomic,strong) NSString * imagUrl;

+ (instancetype)imageModelWithImageUrl:(NSString  *)url;
@end

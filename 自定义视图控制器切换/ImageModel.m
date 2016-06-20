//
//  ImageModel.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

+ (instancetype)imageModelWithImageUrl:(NSString *)url{
    ImageModel * model = [[ImageModel alloc]init];
    model.imagUrl = url;
    return model;
}

#pragma mark--

- (id)dataObject{
    return self;
}

- (NSString *)imageUrlString{
    return _imagUrl;
}


@end

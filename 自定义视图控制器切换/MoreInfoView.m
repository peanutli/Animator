//
//  MoreInfoView.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/21.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "MoreInfoView.h"

@implementation MoreInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = frame;
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.layer.masksToBounds = YES;
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-50, 0, rect.size.width+50*2, rect.size.height)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

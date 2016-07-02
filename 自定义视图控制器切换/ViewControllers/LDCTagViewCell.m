//
//  LDCTagViewCell.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/30.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCTagViewCell.h"
#import "UIView+SetRect.h"

@implementation LDCTagViewCell

- (void)setRecommendTag:(LDCRecommendTag *)recommendTag{
    _recommendTag = recommendTag;
    self.textLabel.text = recommendTag.theme_name;
    self.backgroundColor = LDCRGBColor(arc4random()%255, arc4random()%255, arc4random()%255);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*
 *调整cell的位置
 **/
- (void)setFrame:(CGRect)frame{
    frame.origin.x = 10;
    frame.size.width -= 20;
    frame.size.height -= 1;
    [super setFrame:frame];
}

@end

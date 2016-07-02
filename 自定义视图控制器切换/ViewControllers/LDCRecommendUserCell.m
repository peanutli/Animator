//
//  LDCRecommendUserCell.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/29.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCRecommendUserCell.h"

@implementation LDCRecommendUserCell

-(void)setUser:(LDCRecommendUser *)user{
    _user = user;
    self.textLabel.text = user.screen_name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

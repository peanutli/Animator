//
//  CustomInfiniteLoopViewCell.h
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteLoopViewProtocol.h"

@interface CustomInfiniteLoopViewCell : UICollectionViewCell

@property (nonatomic,weak) id <InfiniteLoopViewProtocol> dataModel;
@property (nonatomic,weak) NSIndexPath  * indexPath;

- (void)setupCollectionViewCell;
- (void)buildSubView;
- (void)loadContent;
- (void)willDisplay;
- (void)didEndDisplay;

@end

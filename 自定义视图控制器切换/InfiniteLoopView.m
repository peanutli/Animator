//
//  InfiniteLoopView.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/19.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "InfiniteLoopView.h"

@interface InfiniteLoopView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic,strong) NSTimer * currentTimer;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) BOOL isAnimating;

@end

@implementation InfiniteLoopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollTimerInterval = 4.0f;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //init flowLayout
        self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
        self.flowLayout.minimumLineSpacing = 14.f;
        self.flowLayout.itemSize = self.bounds.size;
        
        //init collectionView
        self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.pagingEnabled = YES;
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)reset{
    
}

- (void)perpare{
    self.flowLayout.scrollDirection = self.scrollDirection;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:self.customClass forCellWithReuseIdentifier:NSStringFromClass(self.customClass)];
    [self.collectionView reloadData];
    
    if (self.models.count>0) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:100] atScrollPosition:(self.flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal ? UICollectionViewScrollPositionLeft : UICollectionViewScrollPositionTop) animated:NO];
    }
}

- (void)stopLoopAnimation{
    

}

- (void)startLoopAnimation{

}



#pragma mark--UICollectionDelegate&&UICollectionDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5000;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.models.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"====section%ld",indexPath.section);
    NSLog(@"=======%ld",indexPath.row);
    CustomInfiniteLoopViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.customClass) forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.dataModel = self.models[indexPath.row];
    [cell loadContent];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

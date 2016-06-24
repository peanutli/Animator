//
//  FirstViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/15.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "PushAnimated.h"
#import "PopAnimated.h"
#import "GCDQueue.h"
#import "UIView+SetRect.h"
#import "ListItemCell.h"
#import "SpringScaleViewController.h"
#import "ScrollViewAnimationController.h"
#import "InfiniteLoopViewController.h"
#import "ScrollParallax ViewController.h"
static NSString *CellIdentifier = @"CellIdentifier";
static NSInteger kNavButtonTag = 2000;
@interface FirstViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSArray * dataArray;
@end

@implementation FirstViewController
#pragma mark--

#pragma mark--lifeCycle

- (instancetype)init{
    self = [super init];
    if (self) {
        self.title = @"FirstVC";
    }
    return self;
}

- (void)layoutSubViews{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    LDCLog(@"hello world");
    self.navigationController.delegate = self;

    UIBarButtonItem * leftButtonItem = [self setupBarButtonItem:@"user_sel" selecImage:@"user" tag:kNavButtonTag + 1];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    UIBarButtonItem * rightButtonItem1 = [self setupBarButtonItem:@"home_sel" selecImage:@"home" tag:kNavButtonTag + 1];
    UIBarButtonItem * rightButtonItem2 = [self setupBarButtonItem:@"search_sel" selecImage:@"search" tag:kNavButtonTag + 1];
    self.navigationItem.rightBarButtonItems = @[rightButtonItem1,rightButtonItem2];
    
    self.view.backgroundColor = [UIColor grayColor];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"进入下一个控制器" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(transitionVC) forControlEvents:UIControlEventTouchUpInside];
   
    self.tableView = [[UITableView alloc]initWithFrame:ScreenFrame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ListItemCell class] forCellReuseIdentifier:CellIdentifier];
    
    
    [GCDQueue executedInMainQueue:^{
        self.dataArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13", nil];
        NSMutableArray * indexPaths = [[NSMutableArray alloc]init];
        [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:0]];
        }];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    } afterDelaySecs:1.5f];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--privateMethod
- (void)transitionVC{
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)addUser{
    
}

- (void)barButtonClicked{
    
}

- (UIBarButtonItem *)setupBarButtonItem:(NSString *)image selecImage:(NSString *)selecImage tag:(NSInteger)tag{
    UIButton * barButton = [[UIButton alloc]init];
    [barButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [barButton setBackgroundImage:[UIImage imageNamed:selecImage] forState:UIControlStateHighlighted];
    barButton.tag =tag;
    [barButton addTarget:self action:@selector(barButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    barButton.size = [barButton currentBackgroundImage].size;
    UIBarButtonItem * buttonImtem = [[UIBarButtonItem alloc]initWithCustomView:barButton];
    return buttonImtem;
}

#pragma mark --NavgationControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return [PushAnimated new];
    }
    else if (operation == UINavigationControllerOperationPop){
        return [PopAnimated new];
    }
    else {
        return nil;
    }
}

#pragma mark --UITableViewDelegate And UITablViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItemCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"hello world %@",[self.dataArray objectAtIndex:indexPath.row]];
    //cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SpringScaleViewController * springVC = [[SpringScaleViewController alloc]init];
//    [self.navigationController pushViewController:springVC animated:YES];
//    ScrollViewAnimationController * scrollVC = [[ScrollViewAnimationController alloc]init];
//    [self.navigationController pushViewController:scrollVC animated:YES];
    
    InfiniteLoopViewController * loopVC = [[InfiniteLoopViewController alloc]init];
    [self.navigationController pushViewController:loopVC animated:YES];
//    ScrollParallaxViewController * parallaxVC = [[ScrollParallaxViewController alloc]init];
//    [self.navigationController pushViewController:parallaxVC animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

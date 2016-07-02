//
//  LDCRecommendViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/27.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCRecommendViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"
#import "LDCRecommendCategory.h"
#import "LDCRecommendUser.h"
#import "LDCRecommendUserCell.h"

#define LDCSelectedCategory self.categories[self.menuTableView.indexPathForSelectedRow.row]

@interface LDCRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 左边的表格*/
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

/** 右边的表格*/
@property (weak, nonatomic) IBOutlet UITableView *recommendTableView;

/** 左边的类别数据*/
@property (nonatomic,strong) NSArray * categories;

/** AFN请求管理者*/
@property (nonatomic,strong) AFHTTPSessionManager * httpManager;

/**当前请求参数*/
@property (nonatomic,strong) NSMutableDictionary * parameters;

@end

@implementation LDCRecommendViewController

static NSString * menuCellIdentifier = @"menuCellIdentifier";
static NSString * recommendCellIdentifier = @"recommendCellIdentifier";

- (AFHTTPSessionManager *)httpManager{
    if (!_httpManager) {
        _httpManager = [AFHTTPSessionManager manager];
    }
    return _httpManager;
}

- (void)setStep{
    [super setStep];
    self.view.backgroundColor=LDCRGBColor((arc4random()%255), (arc4random()%255), (arc4random()%255))
    self.navigationItem.title = @"推荐关注";
   
    //控件初始化
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
    
    //加载左侧数据
    [self loadcategories];
    
}



#pragma mark--UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.menuTableView) return self.categories.count;

    return [LDCSelectedCategory recommendUsers].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _menuTableView) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier];
        cell.textLabel.text =((LDCRecommendCategory *) self.categories[indexPath.row]).name;
        return cell;
    }
    else{
        LDCRecommendUserCell * cell = [tableView dequeueReusableCellWithIdentifier:recommendCellIdentifier];
        cell.user = [LDCSelectedCategory recommendUsers][indexPath.row];
        return cell;
    }
    
}

#pragma mark--UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.menuTableView) {
        [self checkFooterRefreshState];
        if ([LDCSelectedCategory recommendUsers].count>0) {
            [self.recommendTableView reloadData];
        }
        else  [self loadMoreUsers];
    }
    else{
        
    }
}

#pragma mark--NetWorkingMehtod
/**
 * 初始化控件
 */
- (void)setupTableView{
    
    [_menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:menuCellIdentifier];
    [_recommendTableView registerClass:[LDCRecommendUserCell class] forCellReuseIdentifier:recommendCellIdentifier];
    _recommendTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

/**
 *添加刷新控件
 */
- (void)setupRefresh{
    _recommendTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    _recommendTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    self.recommendTableView.mj_footer.hidden = YES;
    
}

#pragma mark--加载用户数据
/**
 * 根据当前category刷新右面列表
 */
- (void)loadNewUsers{
    LDCRecommendCategory * category = LDCSelectedCategory;
    
    //请求参数
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    category.currentPage = 0;
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"page"] = @(++category.currentPage);
    parameters[@"category_id"] = @(category.id);
    self.parameters = parameters;
    
    //发送请求给服务器，加载右侧数据
    [self.httpManager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (self.parameters != parameters) return;
        
        //字典数组 -> 模型数组
        NSArray *users = [LDCRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //清楚所有数据
        [category.recommendUsers removeAllObjects];
        
        //添加到当前列别的的对应的用户数组中
        [category.recommendUsers addObjectsFromArray:users];

        //保存用户的总数
        category.total = [responseObject[@"total"] integerValue];
        
        //判断是不是最后一次请求
       // if (category.total != category.recommendUsers.count) return;
        
        //刷新右面的表格
        [self.recommendTableView reloadData];
        
        LDCLog(@"%ld",category.recommendUsers.count);
        [self checkFooterRefreshState];
        LDCLog(@"%@",responseObject);
        [self.recommendTableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parameters != parameters) return;
        LDCLog(@"请求失败");
    }];
}

/**
 * 根据当前category加载更多users
 */
- (void)loadMoreUsers{
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    LDCRecommendCategory * category = LDCSelectedCategory;
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"page"] = @(++category.currentPage);
    parameters[@"category_id"] = @(category.id);
    self.parameters = parameters;
    [self.httpManager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //判断是否是当前类别下的网络请求
        if (self.parameters != parameters) return;
        
        //把数组字典转化成模型数组
        NSArray * users = [LDCRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //在当前category中添加users到recommendUsers数组中
        [[LDCSelectedCategory recommendUsers] addObjectsFromArray:users];
        category.total = [responseObject[@"total"] integerValue];
        
        [self.recommendTableView reloadData];
        LDCLog(@"%ld",category.recommendUsers.count);
        
        //检查公用的footer刷新组件在当前category下应该保持的状态
        [self checkFooterRefreshState];
        LDCLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parameters != parameters) return;
        LDCLog(@"请求失败");
    }];
    
}

/*
 *加载左侧列表数据
 */
- (void)loadcategories{
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [self.httpManager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.categories = [LDCRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.menuTableView reloadData];
        //默认选中首行
        [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [SVProgressHUD dismiss];
        [self.recommendTableView.mj_header beginRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LDCLog(@"失败");
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
    }];
}

/**
 *检查右侧公用的footer在当前category对应的状态
 */
- (void)checkFooterRefreshState{
    LDCRecommendCategory * category = LDCSelectedCategory;
    self.recommendTableView.mj_footer.hidden = (category.recommendUsers.count == 0);
    if (category.total == category.recommendUsers.count) {
        [self.recommendTableView.mj_footer endRefreshingWithNoMoreData];
    }
    else
        [self.recommendTableView.mj_footer endRefreshing];
}

#pragma mark--viewCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    
    [self.httpManager.operationQueue cancelAllOperations];
}

@end

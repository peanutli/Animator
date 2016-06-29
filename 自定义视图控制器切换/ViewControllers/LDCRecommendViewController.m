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

#define LDCSelectedCategory self.categories[self.menuTableView.indexPathForSelectedRow.row];

@interface LDCRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet UITableView *recommendTableView;
@property (nonatomic,strong) NSArray * users;
@property (nonatomic,strong) NSArray * categories;
@property (nonatomic,strong) AFHTTPSessionManager * httpManager;

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
    [_menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:menuCellIdentifier];
    [_recommendTableView registerClass:[LDCRecommendUserCell class] forCellReuseIdentifier:recommendCellIdentifier];
    _recommendTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [self loadcategories];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   // return 10;
    if (tableView == self.menuTableView) return self.categories.count;

    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _menuTableView) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier];
        cell.textLabel.text =((LDCRecommendCategory *) self.categories[indexPath.row]).name;
        return cell;
    }
    else{
        LDCRecommendUserCell * cell = [tableView dequeueReusableCellWithIdentifier:recommendCellIdentifier];
        cell.textLabel.text = ((LDCRecommendUser *)self.users[indexPath.row]).screen_name;
        return cell;
    }
    
}

#pragma mark--UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.menuTableView) {
        [self loadusers];
    }
    else{
        
    }
}

#pragma mark--NetWorkingMehtod

- (void)loadcategories{
    [SVProgressHUD show];
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [self.httpManager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.categories = [LDCRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.menuTableView reloadData];
        //默认选中首行
        [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LDCLog(@"失败");
        [SVProgressHUD showErrorWithStatus:@"数据加载失败"];
    }];
}

- (void)loadusers{
    [SVProgressHUD show];
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    LDCRecommendCategory * category = LDCSelectedCategory;
    parameters[@"category_id"] = @(category.id);
    [self.httpManager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.users = [LDCRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.recommendTableView reloadData];
        [SVProgressHUD dismiss];
        LDCLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LDCLog(@"请求失败");
        [SVProgressHUD showErrorWithStatus:@"推荐用户请求信息失败"];
    }];
}


@end

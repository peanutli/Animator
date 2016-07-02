//
//  LDCEssenceDetailViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/26.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCEssenceTagViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "LDCRecommendTag.h"
#import "LDCTagViewCell.h"

@interface LDCEssenceTagViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *EssenceTagTable;
@property (strong,nonatomic) NSMutableArray * recommendTags;

@end

@implementation LDCEssenceTagViewController

static NSString * essenceTagIdentifier = @"essenceTagIdentifier";

/**
 *加载Tag标签请求
 */
- (void)loadRecommendTags{
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];

    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    AFHTTPSessionManager * httpManager = [AFHTTPSessionManager manager];
    [httpManager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LDCLog(@"%@",responseObject);
        NSArray * tags = [LDCRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        self.recommendTags = [NSMutableArray arrayWithArray:tags];
        [self.EssenceTagTable reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LDCLog(@"请求出现错误");
    }];
}

- (void)setupTableView{
    self.EssenceTagTable = [[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.EssenceTagTable];
    self.EssenceTagTable.delegate = self;
    self.EssenceTagTable.dataSource = self;
    [self.EssenceTagTable registerClass:[LDCTagViewCell class] forCellReuseIdentifier:essenceTagIdentifier];
    
}
- (void)setStep{
    [super setStep];
    self.navigationItem.title = @"推荐标签";
    
    //配置UITableView
    [self setupTableView];
    
    //加载Tag标签请求
    [self loadRecommendTags];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    [SVProgressHUD dismiss];
}

- (void)dealloc{
    
}

#pragma mark--TableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recommendTags.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LDCTagViewCell * cell = [tableView dequeueReusableCellWithIdentifier:essenceTagIdentifier];
    cell.recommendTag = self.recommendTags[indexPath.row];
    return cell;
}

#pragma mark--TableViewDelegate




#pragma mark--privateMethod

- (void)backVC{
    [self.navigationController popViewControllerAnimated:YES];
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

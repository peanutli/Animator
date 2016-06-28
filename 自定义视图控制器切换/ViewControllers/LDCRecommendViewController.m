//
//  LDCRecommendViewController.m
//  自定义视图控制器切换
//
//  Created by 花生 on 16/6/27.
//  Copyright © 2016年 花生. All rights reserved.
//

#import "LDCRecommendViewController.h"

static NSString * menuCellIdentifier = @"menuCellIdentifier";
static NSString * recommendCellIdentifier = @"recommendCellIdentifier";

@interface LDCRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet UITableView *recommendTableView;

@end

@implementation LDCRecommendViewController

- (void)setStep{
    [super setStep];
    self.view.backgroundColor=LDCRGBColor((arc4random()%255), (arc4random()%255), (arc4random()%255))
    self.navigationItem.title = @"推荐关注";
    [_menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:menuCellIdentifier];
    [_recommendTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:recommendCellIdentifier];
    _recommendTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _menuTableView) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    }
    else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:recommendCellIdentifier];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    }
    
}




#pragma mark--UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _recommendTableView.backgroundColor = LDCRGBColor((arc4random()%255), (arc4random()%255), (arc4random()%255));
    [_recommendTableView reloadData];
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

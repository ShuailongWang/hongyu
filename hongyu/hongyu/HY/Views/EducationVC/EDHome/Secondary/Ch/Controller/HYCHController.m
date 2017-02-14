//
//  HYCHController.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCHController.h"
#import "HYHomeJobCell.h"
#import "HYCVModel.h"
#import "HYCVController.h"

@interface HYCHController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) NSArray *myData;

@end

@implementation HYCHController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    [self loadData];
}

#pragma mark - loadData
-(void)loadData{
    self.myData = [HYCVModel HYCVModelWithArray];
    
    [self.myTableView reloadData];
}

#pragma mark - 设置UI
-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        _myTableView.estimatedRowHeight = 120;
        _myTableView.rowHeight = UITableViewAutomaticDimension;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - UITableDelagate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYHomeJobCell *cell = [HYHomeJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    HYCVModel *model = self.myData[indexPath.row];
    cell.model = model;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HYCVModel *CVModel = self.myData[indexPath.row];
    
    HYCVController *CVVC = [[HYCVController alloc]init];
    CVVC.model = CVModel;
    [self.navigationController pushViewController:CVVC animated:YES];
    
}

#pragma mark - 懒加载
-(NSArray *)myData{
    if (nil == _myData) {
        _myData = [NSArray array];
    }
    return _myData;
}


@end

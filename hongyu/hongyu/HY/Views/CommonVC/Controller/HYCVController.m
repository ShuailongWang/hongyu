//
//  HYCVController.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVController.h"
#import "HYCVModel.h"
#import "HYSectionHeadView.h"
#import "HYCVHeadCell.h"
#import "HYCVInforCell.h"
#import "HYCVJobCell.h"
#import "HYCVItemsCell.h"
#import "HYCVEducationCell.h"

@interface HYCVController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (strong,nonatomic) UIView *bottomView;

@end


@implementation HYCVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"详情";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height - 50) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
    if (nil == _bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, _myTableView.bottom, KScreen_Width, 50)];
        [self.view addSubview:_bottomView];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, KScreen_Width - 20, 40)];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"发起邀请" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:btn];
    }
}
//点击按钮
-(void)clickButton{
    NSLog(@"12");
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return self.model.Items.count > 0 ? self.model.Items.count : 0;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //MARK: - 用户头像
        HYCVHeadCell *cell = [HYCVHeadCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.model = self.model;
        return cell;
    } else if(indexPath.section == 1){
        //MARK: - 基本信息
        HYCVInforCell *cell = [HYCVInforCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.model = self.model;
        return cell;
    } else if(indexPath.section == 2){
        //MARK: - 期望职位
        HYCVJobCell *cell = [HYCVJobCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.model = self.model;
        return cell;
    } else if(indexPath.section == 3){
        //MARK: - 工作经历
        HYCVItemsCell *cell = [HYCVItemsCell cellWithTableView:tableView NSIndexPath:indexPath];
        HYCVItemsModel *itemModel = self.model.Items[indexPath.row];
        cell.model = itemModel;
        return cell;
    }
    //MARK: - 教育经历
    HYCVEducationCell *cell = [HYCVEducationCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.model = self.model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 194;
    }else if (indexPath.section == 1) {
        return 163;
    }else if (indexPath.section == 2) {
        return 180;
    }else if (indexPath.section == 3) {
        return [HYCVItemsCell cellRowHeight:self.model.Items[indexPath.row]];;
    }
    return 108;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//MARK - model
-(void)setModel:(HYCVModel *)model{
    _model = model;
    
    [self.myTableView reloadData];
}

@end

//
//  HYOTHomeController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYOTHomeController.h"
#import "HYHomeCollectionCell.h"
#import "HYHomeCycleCell.h"
#import "HYHomeJobCell.h"
#import "HYHomeTypeModel.h"
#import "HYHomeNewsModel.h"
#import "HYJobModel.h"
#import "HYSectionHeadView.h"
#import "HYCompanyController.h"
#import "HYOChController.h"
#import "HYOENController.h"
#import "HYOFoodController.h"
#import "HYODressController.h"
#import "HYOTeacherController.h"
#import "HYOAdvertiseController.h"

@interface HYOTHomeController ()<UITableViewDelegate, UITableViewDataSource, HYHomeCollectionCellDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *homeTypeList;
@property (nonatomic, strong) NSArray *homeNewsList;
@property (nonatomic, strong) NSArray *homeJobList;

@end

@implementation HYOTHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 1;
    }
    return self.homeJobList.count > 0 ? self.homeJobList.count : 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HYHomeCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCollectionCell"];
        if (nil == cell) {
            cell = [[HYHomeCollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCollectionCell"];
        }
        cell.typeArr = self.homeTypeList;
        cell.delegate = self;
        
        return cell;
    } else if (indexPath.section == 1) {
        //MARK: - 文字轮播图
        HYHomeCycleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCycleCellID"];
        if (nil == cell) {
            cell = [[HYHomeCycleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCycleCellID"];
        }
        cell.newsArr = self.homeNewsList;
        
        return cell;
    }
    //MARK: - 列表
    HYHomeJobCell *cell = [HYHomeJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    HYCVModel *CVModel = self.homeJobList[indexPath.row];
    cell.model = CVModel;
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return HYHomeCollectionCellHeight * 2;
    }else if(indexPath.section == 1){
        return 60;
    }
    return 173;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    } else if (section == 1){
        return 0.01;
    }
    return 30;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 30)];
    
    //判断是否有数据
    if (section == 2 && self.homeJobList.count > 0){
        headView.nameLabel.text = @"猜你喜欢";
        return headView;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        HYJobModel *jobModel = self.homeJobList[indexPath.row];
        
        HYCompanyController *companyVC = [[HYCompanyController alloc]init];
        companyVC.model = jobModel;
        [self.navigationController pushViewController:companyVC animated:YES];
    }
}

#pragma mark - HYHomeCollectionCellDelaegate
-(void)RGHomeCollCell:(HYHomeCollectionCell *)homeCollCell index:(NSInteger)index itemTitle:(NSString *)itemTitle{
    switch (index) {
        case 0:{
            HYOChController *chVC = [[HYOChController alloc]init];
            chVC.title = itemTitle;
            [self.navigationController pushViewController:chVC animated:YES];
        }
            break;
        case 1:{
            HYOEnController *enVC = [[HYOEnController alloc]init];
            enVC.title = itemTitle;
            [self.navigationController pushViewController:enVC animated:YES];
        }
            break;
        case 2:{
            HYOFoodController *foodVC = [[HYOFoodController alloc]init];
            foodVC.title = itemTitle;
            [self.navigationController pushViewController:foodVC animated:YES];
        }
            break;
        case 3:{
            HYODressController *dressVC = [[HYODressController alloc]init];
            dressVC.title = itemTitle;
            [self.navigationController pushViewController:dressVC animated:YES];
        }
            break;
        case 4:{
            HYOTeacherController *tearchVC = [[HYOTeacherController alloc]init];
            tearchVC.title = itemTitle;
            [self.navigationController pushViewController:tearchVC animated:YES];
        }
            break;
        case 5:{
            HYOAdvertiseController *advertiseVC = [[HYOAdvertiseController alloc]init];
            advertiseVC.title = itemTitle;
            [self.navigationController pushViewController:advertiseVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - 懒加载
-(NSArray *)homeTypeList{
    if (nil == _homeTypeList) {
        _homeTypeList = [HYHomeTypeModel HYHomeTypeModelWithArray];
    }
    return _homeTypeList;
}
-(NSArray *)homeNewsList{
    if (nil == _homeNewsList) {
        _homeNewsList = [HYHomeNewsModel HYHomeNewsModelWithArray];
    }
    return _homeNewsList;
}
-(NSArray *)homeJobList{
    if (nil == _homeJobList) {
        _homeJobList = [HYJobModel HYJobModelWithArray];
    }
    return _homeJobList;
}


@end

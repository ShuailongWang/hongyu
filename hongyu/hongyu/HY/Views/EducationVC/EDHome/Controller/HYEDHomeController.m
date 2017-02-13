//
//  HYEDHomeController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDHomeController.h"
#import "HYHomeCollectionCell.h"
#import "HYHomeCycleCell.h"
#import "HYHomeJobCell.h"
#import "HYSectionHeadView.h"
#import "HYHomeModel.h"
#import "HYCVController.h"
#import "HYCHController.h"
#import "HYENController.h"
#import "HYFoodController.h"
#import "HYDressController.h"
#import "HYTeacherController.h"
#import "HYAdvertiseController.h"

@interface HYEDHomeController ()<UITableViewDelegate, UITableViewDataSource, HYHomeCollectionCellDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *typeArr;
@property (nonatomic, strong) NSArray *homeList;

@end

static NSString *UITableViewCellID = @"UITableViewCellID";

@implementation HYEDHomeController

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
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
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
    NSArray *jobArr = self.homeList[section];
    return jobArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HYHomeCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCollectionCell"];
        if (nil == cell) {
            cell = [[HYHomeCollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCollectionCell"];
        }
        cell.typeArr = self.homeList[indexPath.section];
        cell.delegate = self;
        
        return cell;
    } else if (indexPath.section == 1) {
        //MARK: - 文字轮播图
        HYHomeCycleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCycleCellID"];
        if (nil == cell) {
            cell = [[HYHomeCycleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCycleCellID"];
        }
        cell.newsArr = self.homeList[indexPath.section];
        
        return cell;
    }
    HYHomeJobCell *cell = [HYHomeJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    NSArray *jobArr = self.homeList[indexPath.section];
    HYCVModel *CVModel = jobArr[indexPath.row];
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
    if (section == 0 || section == 1) {
        return nil;
    }else if (section == 2){
        //判断是否有数据
        headView.nameLabel.text = @"猜你喜欢";
    }else if (section == 3){
        //判断是否有数据
        headView.nameLabel.text = @"您可能还想看";
    }
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 2) {
        NSArray *jobArr = self.homeList[indexPath.section];
        HYCVModel *CVModel = jobArr[indexPath.row];
        
        HYCVController *CVVC = [[HYCVController alloc]init];
        CVVC.model = CVModel;
        [self.navigationController pushViewController:CVVC animated:YES];
    }
}

#pragma mark - HYHomeCollectionCellDelaegate
-(void)RGHomeCollCell:(HYHomeCollectionCell *)homeCollCell index:(NSInteger)index itemTitle:(NSString *)itemTitle{
    switch (index) {
        case 0:{
            HYCHController *chVC = [[HYCHController alloc]init];
            chVC.title = itemTitle;
            [self.navigationController pushViewController:chVC animated:YES];
        }
            break;
        case 1:{
            HYENController *enVC = [[HYENController alloc]init];
            enVC.title = itemTitle;
            [self.navigationController pushViewController:enVC animated:YES];
        }
            break;
        case 2:{
            HYFoodController *foodVC = [[HYFoodController alloc]init];
            foodVC.title = itemTitle;
            [self.navigationController pushViewController:foodVC animated:YES];
        }
            break;
        case 3:{
            HYDressController *dressVC = [[HYDressController alloc]init];
            dressVC.title = itemTitle;
            [self.navigationController pushViewController:dressVC animated:YES];
        }
            break;
        case 4:{
            HYTeacherController *tearchVC = [[HYTeacherController alloc]init];
            tearchVC.title = itemTitle;
            [self.navigationController pushViewController:tearchVC animated:YES];
        }
            break;
        case 5:{
            HYAdvertiseController *advertiseVC = [[HYAdvertiseController alloc]init];
            advertiseVC.title = itemTitle;
            [self.navigationController pushViewController:advertiseVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - 懒加载
-(NSArray *)homeList{
    if (nil == _homeList) {
        _homeList = [HYHomeModel HYHomeModelWithArray];
    }
    return _homeList;
}


@end

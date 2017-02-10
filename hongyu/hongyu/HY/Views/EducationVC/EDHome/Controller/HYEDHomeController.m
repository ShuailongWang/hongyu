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
#import "HYSectionHeadView.h"

@interface HYEDHomeController ()<UITableViewDelegate, UITableViewDataSource, HYHomeCollectionCellDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *typeArr;

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
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
        [self.view addSubview:_myTableView];
    }
}


#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        HYHomeCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCollectionCell"];
        if (nil == cell) {
            cell = [[HYHomeCollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCollectionCell"];
        }
        cell.typeArr = self.typeArr;
        cell.delegate = self;
        
        return cell;
    }
    //MARK: - 文字轮播图
    HYHomeCycleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCycleCellID"];
    if (nil == cell) {
        cell = [[HYHomeCycleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCycleCellID"];
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return HYHomeCollectionCellHeight * 2;
    }
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }
    return 30;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 30)];
    if (section == 0) {
        return nil;
    }else if (section == 1){
        //判断是否有数据
        headView.nameLabel.text = @"猜你喜欢";
    }else if (section == 2){
        //判断是否有数据
        headView.nameLabel.text = @"您可能还想看";
    }
    return headView;
}

#pragma mark - HYHomeCollectionCellDelaegate
-(void)RGHomeCollCell:(HYHomeCollectionCell *)homeCollCell index:(NSInteger)index itemTitle:(NSString *)itemTitle{
    
}

#pragma mark - 懒加载
-(NSArray *)typeArr{
    if (nil == _typeArr) {
        _typeArr = @[
                     @{@"Title":@"中", @"Icon":@"error"},
                     @{@"Title":@"外", @"Icon":@"error"},
                     @{@"Title":@"我的", @"Icon":@"error"},
                     @{@"Title":@"我的", @"Icon":@"error"},
                     @{@"Title":@"我的", @"Icon":@"error"},
                     @{@"Title":@"我的", @"Icon":@"error"}
                     ];
    }
    return _typeArr;
}

@end

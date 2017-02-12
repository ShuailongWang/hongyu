//
//  HYEDMineController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDMineController.h"
#import "HYMineHeadCell.h"
#import "HYMineTwoCell.h"
#import "HYSettingController.h"

@interface HYEDMineController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) NSArray *mineArr;


@end


@implementation HYEDMineController

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
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 2;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *sectionArr;
    NSDictionary *dict;
    if (indexPath.section != 0) {
        sectionArr = self.mineArr[indexPath.section - 1];
        dict = sectionArr[indexPath.row];
    }
    //头像
    if (indexPath.section == 0) {
        HYMineHeadCell *cell = [HYMineHeadCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.myBlock = ^{

        };
        return cell;
    }else if (indexPath.section == 1){
        HYMineTwoCell *cell = [HYMineTwoCell cellWithTableView:tableView NSIndexPath:indexPath];
        
        cell.iconImageView.image = [UIImage imageNamed:dict[@"Icon"]];
        cell.titleLabel.text = dict[@"Title"];
        cell.subTitle.text = dict[@"SubTitle"];
        
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
    }
    //右边箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:dict[@"Icon"]];
    cell.textLabel.text = dict[@"Title"];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 190;
    } else if (indexPath.section == 1) {
        return 128;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1) {
        
    } else if (indexPath.section == 2) {
        
    } else if (indexPath.section == 3) {
        HYSettingController *settingVC = [[HYSettingController alloc]init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
}


-(NSArray *)mineArr{
    if (nil == _mineArr) {
        _mineArr = @[
                     @[@{@"Icon":@"ic_list_home", @"Title":@"我的主页", @"SubTitle":@"分享主页让更多的人看到你"}],
                     @[@{@"Icon":@"ic_list_position", @"Title":@"我的发布"},
                       @{@"Icon":@"ic_list_company", @"Title":@"我的简介"}],
                     @[@{@"Icon":@"ic_list_set", @"Title":@"设置"}]
                     ];
    }
    return _mineArr;
}

@end

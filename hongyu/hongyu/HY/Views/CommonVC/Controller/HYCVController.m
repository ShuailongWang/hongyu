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

@interface HYCVController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end

static NSString *UITableViewCellID = @"UITableViewCellID";

@implementation HYCVController

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
        _myTableView.estimatedRowHeight = 120;
        _myTableView.rowHeight = UITableViewAutomaticDimension;
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
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //MARK: - 用户头像
        HYCVHeadCell *cell = [HYCVHeadCell cellWithTableView:tableView NSIndexPath:indexPath];
        [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.model.UserPicture] placeholderImage:[UIImage imageNamed:@"error"]];
        cell.titleLabel.text = self.model.UserName;
        cell.subTitleLabel.text = [NSString stringWithFormat:@"%@-%@-%@",self.model.WorkCity, self.model.WorkingExp, self.model.Education];
        return cell;
    } else if(indexPath.row == 1){
        //MARK: - 基本信息
        HYCVInforCell *cell = [HYCVInforCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.ageLabel.text = [NSString stringWithFormat:@"%@", self.model.Age];
        cell.OverseasLabel.text = self.model.Overseas ? @"有" : @"无";
        return cell;
    }
    HYCVJobCell *cell = [HYCVJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.expectJobLabel.text = self.model.ExpectJob;
    cell.placeLabel.text = self.model.CityDistrict;
    cell.salaLabel.text = self.model.Salary;
    cell.jobTypeLabel.text = self.model.JobType;
    cell.emplTypeLabel.text = self.model.EmplType;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

//MARK - model
-(void)setModel:(HYCVModel *)model{
    _model = model;
    
    [self.myTableView reloadData];
}

@end

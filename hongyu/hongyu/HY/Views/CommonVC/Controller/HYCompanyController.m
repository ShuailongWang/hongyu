//
//  HYCompanyController.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCompanyController.h"
#import "HYJobModel.h"
#import "HYCompHeadCell.h"
#import "HYCompJongUploadCell.h"
#import "HYCompDetailCell.h"
#import "HYCompContCell.h"
#import "HYCompAddresCell.h"

@interface HYCompanyController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (strong,nonatomic) UIView *bottomView;

@end

@implementation HYCompanyController

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
        _myTableView.estimatedRowHeight = 120;
        _myTableView.rowHeight = UITableViewAutomaticDimension;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
    if (nil == _bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, _myTableView.bottom, KScreen_Width, 50)];
        [self.view addSubview:_bottomView];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, KScreen_Width - 20, 40)];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"投递简历" forState:UIControlStateNormal];
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
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HYCompHeadCell *cell = [HYCompHeadCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.jobNameLabel.text = self.model.JobName;
        cell.timeLabel.text = self.model.PublishTime;
        cell.sepleLabel.text = self.model.Salary;
        cell.placeLabel.text = self.model.WorkCity;
        cell.workingExpLabel.text = self.model.WorkingExp;
        cell.ducationLabel.text = self.model.Education;
        return cell;
    }else if (indexPath.section == 1){
        //MARK: - 发布人
        HYCompJongUploadCell *cell = [HYCompJongUploadCell cellWithTableView:tableView NSIndexPath:indexPath];
        [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.model.CompanyLogo] placeholderImage:[UIImage imageNamed:@"error"]];
        cell.upladJobLabel.text = self.model.UploadName;
        cell.upladJobLabel.text = self.model.UploadJob;
        cell.companyLabel.text = self.model.CompanyName;
        return cell;
    }else if (indexPath.section == 2){
        //MARK: - 岗位职责
        HYCompDetailCell *cell = [HYCompDetailCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.jobDetailsLabel.text = self.model.JobDetails;
        return cell;
    }else if (indexPath.section == 3){
        //MARK: - 联系人
        HYCompContCell *cell = [HYCompContCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.ContactLabel.text = self.model.ContactName;
        cell.contactPhoneLabel.text = self.model.ContactPhone;
        cell.contactEmailLabel.text = self.model.ContactEmail;
        return cell;
    }
    //MARK: - 工作地址
    HYCompAddresCell *cell = [HYCompAddresCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.workAddresLabel.text = self.model.WorkAddress;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

//model赋值
-(void)setModel:(HYJobModel *)model{
    _model = model;
    
    [self.myTableView reloadData];
}

@end

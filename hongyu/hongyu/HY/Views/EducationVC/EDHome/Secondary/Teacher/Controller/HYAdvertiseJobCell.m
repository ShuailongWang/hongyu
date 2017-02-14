//
//  HYAdvertiseJobCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYAdvertiseJobCell.h"
#import "HYCVModel.h"

@interface HYAdvertiseJobCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;
@property (weak, nonatomic) IBOutlet UILabel *jobNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *WorkingExpLabel;
@property (weak, nonatomic) IBOutlet UILabel *EducationLabel;
@property (weak, nonatomic) IBOutlet UILabel *expectJobLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;

@end

@implementation HYAdvertiseJobCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = kBagroundColor;
    //变成圆角
    self.iconImageView.layer.cornerRadius = 40;
    self.iconImageView.layer.masksToBounds = YES;        //把多余的删除
}

-(void)setModel:(HYCVModel *)model{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.UserPicture] placeholderImage:[UIImage imageNamed:@"error"]];
    self.userNameLabel.text = model.UserName;
    self.sexImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.Sex ? @"Sex_man" : @"Sex_woman"]];
    self.jobNameLabel.text = model.JobName;
    self.timeLabel.text = model.PublishTime;
    NSArray *items = model.Items;
    if (items.count > 0) {
        HYCVItemsModel *itemModel = items[0];
        self.companyNameLabel.text = itemModel.CompanyName;
    }
    self.placeLabel.text = model.WorkCity;
    self.WorkingExpLabel.text = model.WorkingExp;
    self.EducationLabel.text = model.Education;
    self.expectJobLabel.text = model.ExpectJob;
    self.salaryLabel.text = model.Salary;
}


@end

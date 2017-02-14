//
//  HYAdvertiseJobCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYAdvertiseJobCell.h"

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
    
    //变成圆角
    self.iconImageView.layer.cornerRadius = 40;
    self.iconImageView.layer.masksToBounds = YES;        //把多余的删除
}



@end

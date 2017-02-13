//
//  HYCVInforCell.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVInforCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *inforTelLabel;    //电话
@property (weak, nonatomic) IBOutlet UILabel *inforEmailLabel;  //邮箱
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;         //年龄
@property (weak, nonatomic) IBOutlet UILabel *OverseasLabel;    //海外


+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

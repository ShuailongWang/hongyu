//
//  HYCVInforCell.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVInforCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *inforTelLabel;
@property (weak, nonatomic) IBOutlet UILabel *inforEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *OverseasLabel;


+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

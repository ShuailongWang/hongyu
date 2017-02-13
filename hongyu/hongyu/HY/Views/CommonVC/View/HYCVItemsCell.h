//
//  HYCVItemsCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVItemsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *jobAddCompanyLable;   //职位 | 公司名
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;            //时间
@property (weak, nonatomic) IBOutlet UILabel *companyDutyLabel;     //职责

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

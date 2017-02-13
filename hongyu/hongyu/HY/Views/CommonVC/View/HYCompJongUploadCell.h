//
//  HYCompJongUploadCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCompJongUploadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//logo
@property (weak, nonatomic) IBOutlet UILabel *uploadNameLabel;  //发布人
@property (weak, nonatomic) IBOutlet UILabel *upladJobLabel;//职位
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;//公司名

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

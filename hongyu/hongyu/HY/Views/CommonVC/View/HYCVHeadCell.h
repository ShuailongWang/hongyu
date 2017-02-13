//
//  HYCVHeadCell.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVHeadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;    //头像
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;           //用户名
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;        //地址-工作时间-学历

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

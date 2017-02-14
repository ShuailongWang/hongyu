//
//  HYCVHeadCell.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYCVModel;
@interface HYCVHeadCell : UITableViewCell

@property (nonatomic, strong) HYCVModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

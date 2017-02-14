//
//  HYCVEducationCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYCVModel;
@interface HYCVEducationCell : UITableViewCell

@property (nonatomic, strong) HYCVModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

//
//  HYCompDetailCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYJobModel;
@interface HYCompDetailCell : UITableViewCell

@property (nonatomic, strong) HYJobModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)cellRowHeight:(HYJobModel*)model;

@end

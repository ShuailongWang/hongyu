//
//  HYCVItemsCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYCVItemsModel;
@interface HYCVItemsCell : UITableViewCell

@property (nonatomic, strong) HYCVItemsModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)cellRowHeight:(HYCVItemsModel*)model;

@end

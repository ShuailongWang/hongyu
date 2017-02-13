//
//  HYCompDetailCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCompDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *jobDetailsLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

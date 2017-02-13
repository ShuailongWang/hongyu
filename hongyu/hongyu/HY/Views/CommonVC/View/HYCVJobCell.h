//
//  HYCVJobCell.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVJobCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *expectJobLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *emplTypeLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

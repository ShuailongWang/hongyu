//
//  HYCVEducationCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVEducationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *specialSchoolLabel;   //专业|学校
@property (weak, nonatomic) IBOutlet UILabel *timeAndAcademicLabel; //时间|学历

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

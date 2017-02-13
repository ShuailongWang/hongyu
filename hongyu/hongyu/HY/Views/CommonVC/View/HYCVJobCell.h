//
//  HYCVJobCell.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCVJobCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *expectJobLabel;   //职位名称
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;       //地址
@property (weak, nonatomic) IBOutlet UILabel *salaLabel;        //薪资
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;     //职位类别
@property (weak, nonatomic) IBOutlet UILabel *emplTypeLabel;    //求职性质

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

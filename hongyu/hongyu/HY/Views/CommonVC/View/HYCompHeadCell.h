//
//  HYCompHeadCell.h
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCompHeadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *jobNameLabel; //职位
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;    //时间
@property (weak, nonatomic) IBOutlet UILabel *sepleLabel;   //薪资
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;   //地址
@property (weak, nonatomic) IBOutlet UILabel *workingExpLabel;//年限
@property (weak, nonatomic) IBOutlet UILabel *ducationLabel;//学历

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end

//
//  HYCompHeadCell.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCompHeadCell.h"
#import "HYJobModel.h"

@interface HYCompHeadCell()

@property (weak, nonatomic) IBOutlet UILabel *jobNameLabel; //职位
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;    //时间
@property (weak, nonatomic) IBOutlet UILabel *sepleLabel;   //薪资
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;   //地址
@property (weak, nonatomic) IBOutlet UILabel *workingExpLabel;//年限
@property (weak, nonatomic) IBOutlet UILabel *ducationLabel;//学历

@end

@implementation HYCompHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFrame:(CGRect)frame{
    //修改cell的左右边距为10;
    //修改cell的Y值下移10;
    //修改cell的高度减少10;
    
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2 * frame.origin.x;
    
    [super setFrame:frame];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYCompHeadCell";
    
    HYCompHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYJobModel *)model{
    _model = model;
    self.jobNameLabel.text = model.JobName;
    self.timeLabel.text = model.PublishTime;
    self.sepleLabel.text = model.Salary;
    self.placeLabel.text = model.WorkCity;
    self.workingExpLabel.text = model.WorkingExp;
    self.ducationLabel.text = model.Education;
}

@end

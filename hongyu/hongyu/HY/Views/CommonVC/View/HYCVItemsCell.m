//
//  HYCVItemsCell.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVItemsCell.h"
#import "HYCVModel.h"

@interface HYCVItemsCell()

@property (weak, nonatomic) IBOutlet UILabel *jobAddCompanyLable;   //职位 | 公司名
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;            //时间
@property (weak, nonatomic) IBOutlet UILabel *companyDutyLabel;     //职责

@end

@implementation HYCVItemsCell

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
    static NSString *identifier = @"HYCVItemsCell";
    
    HYCVItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYCVItemsModel *)model{
    _model = model;
    
    self.jobAddCompanyLable.text = [NSString stringWithFormat:@"%@ | %@", model.JobName, model.CompanyName];
    self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@", [model.StartTime StringWithDate], [model.EndTime StringWithDate]];
    self.companyDutyLabel.text = model.Summary;
}

+ (CGFloat)cellRowHeight:(HYCVItemsModel*)model{
    
    CGFloat height = [model.Summary getHeightWithFont:14 constrainedToSize:CGSizeMake(KScreen_Width - 20, CGFLOAT_MAX)];
    
    return (120 + height);
}












@end

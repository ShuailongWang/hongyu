//
//  HYCVJobCell.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVJobCell.h"
#import "HYCVModel.h"

@interface HYCVJobCell()

@property (weak, nonatomic) IBOutlet UILabel *expectJobLabel;   //职位名称
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;       //地址
@property (weak, nonatomic) IBOutlet UILabel *salaLabel;        //薪资
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;     //职位类别
@property (weak, nonatomic) IBOutlet UILabel *emplTypeLabel;    //求职性质

@end

@implementation HYCVJobCell

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
    static NSString *identifier = @"HYCVJobCell";
    
    HYCVJobCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYCVModel *)model{
    _model = model;
    
    self.expectJobLabel.text = model.ExpectJob;
    self.placeLabel.text = model.CityDistrict;
    self.salaLabel.text = model.Salary;
    self.jobTypeLabel.text = model.JobType;
    self.emplTypeLabel.text = model.EmplType;
}

@end

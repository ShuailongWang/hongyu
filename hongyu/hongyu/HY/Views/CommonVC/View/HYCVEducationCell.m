//
//  HYCVEducationCell.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVEducationCell.h"
#import "HYCVModel.h"

@interface HYCVEducationCell()

@property (weak, nonatomic) IBOutlet UILabel *specialSchoolLabel;   //专业|学校
@property (weak, nonatomic) IBOutlet UILabel *timeAndAcademicLabel; //时间|学历

@end

@implementation HYCVEducationCell

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
    static NSString *identifier = @"HYCVEducationCell";
    
    HYCVEducationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}
-(void)setModel:(HYCVModel *)model{
    _model = model;
    
    self.specialSchoolLabel.text = [NSString stringWithFormat:@"%@ | %@",model.Speciiality, model.School];
    self.timeAndAcademicLabel.text = [NSString stringWithFormat:@"%@-%@ %@", [model.StartTime StringWithDate], [model.EndTime StringWithDate], model.Education];
}

@end

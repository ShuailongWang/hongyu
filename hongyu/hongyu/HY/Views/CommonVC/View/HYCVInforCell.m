//
//  HYCVInforCell.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVInforCell.h"
#import "HYCVModel.h"

@interface HYCVInforCell()

@property (weak, nonatomic) IBOutlet UILabel *inforTelLabel;    //电话
@property (weak, nonatomic) IBOutlet UILabel *inforEmailLabel;  //邮箱
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;         //年龄
@property (weak, nonatomic) IBOutlet UILabel *OverseasLabel;    //海外

@end

@implementation HYCVInforCell

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
    static NSString *identifier = @"HYCVInforCell";
    
    HYCVInforCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYCVModel *)model{
    _model = model;
    self.ageLabel.text = [NSString stringWithFormat:@"%@", model.Age];
    self.OverseasLabel.text = model.Overseas ? @"有" : @"无";
}

@end

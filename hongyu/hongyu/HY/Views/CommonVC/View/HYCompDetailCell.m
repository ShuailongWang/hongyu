//
//  HYCompDetailCell.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCompDetailCell.h"
#import "HYJobModel.h"

@interface HYCompDetailCell()


@property (weak, nonatomic) IBOutlet UILabel *jobDetailsLabel;

@end

@implementation HYCompDetailCell

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
    static NSString *identifier = @"HYCompDetailCell";
    
    HYCompDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYJobModel *)model{
    _model = model;
    self.jobDetailsLabel.text = model.JobDetails;
}

+ (CGFloat)cellRowHeight:(HYJobModel*)model{
    
    CGFloat height = [model.JobDetails getHeightWithFont:15 constrainedToSize:CGSizeMake(KScreen_Width - 20, CGFLOAT_MAX)];
    
    return (96 + height);
}

@end

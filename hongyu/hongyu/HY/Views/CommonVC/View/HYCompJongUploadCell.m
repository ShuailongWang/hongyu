//
//  HYCompJongUploadCell.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCompJongUploadCell.h"
#import "HYJobModel.h"

@interface HYCompJongUploadCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//logo
@property (weak, nonatomic) IBOutlet UILabel *uploadNameLabel;  //发布人
@property (weak, nonatomic) IBOutlet UILabel *upladJobLabel;//职位
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;//公司名

@end

@implementation HYCompJongUploadCell

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
    static NSString *identifier = @"HYCompJongUploadCell";
    
    HYCompJongUploadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}
-(void)setModel:(HYJobModel *)model{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.CompanyLogo] placeholderImage:[UIImage imageNamed:@"error"]];
    self.upladJobLabel.text = model.UploadName;
    self.upladJobLabel.text = model.UploadJob;
    self.companyLabel.text = model.CompanyName;
}

@end

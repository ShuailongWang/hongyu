//
//  HYCVHeadCell.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVHeadCell.h"

@implementation HYCVHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //变成圆角
    self.iconImageView.layer.cornerRadius = 45;
    self.iconImageView.layer.masksToBounds = YES;        //把多余的删除
}

- (void)setFrame:(CGRect)frame{
    //修改cell的左右边距为10;
    //修改cell的Y值下移10;
    //修改cell的高度减少10;
    
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2 * frame.origin.x;
//    frame.origin.y += margin;
//    frame.size.height -= margin;
    
    [super setFrame:frame];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYCVHeadCell";
    
    HYCVHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end

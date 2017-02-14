//
//  HYFoodDetailInfoCell.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYFoodDetailInfoCell.h"

@interface HYFoodDetailInfoCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *freshNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mianLabel;

@end

@implementation HYFoodDetailInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYFoodDetailInfoCell";
    
    HYFoodDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end

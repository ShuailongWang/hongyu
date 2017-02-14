//
//  HYUpTearchInputCell.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYUpTearchInputCell.h"

@implementation HYUpTearchInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYUpTearchInputCell";
    
    HYUpTearchInputCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end

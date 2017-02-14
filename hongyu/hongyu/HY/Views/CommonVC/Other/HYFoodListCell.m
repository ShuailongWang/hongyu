//
//  HYFoodListCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYFoodListCell.h"

@interface HYFoodListCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;


@end

@implementation HYFoodListCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = kBagroundColor;
}

@end

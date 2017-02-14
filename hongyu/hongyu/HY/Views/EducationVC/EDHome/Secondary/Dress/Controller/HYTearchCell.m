//
//  HYTearchCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYTearchCell.h"

@interface HYTearchCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;    //图标
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;   //标题
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;   //地址
@property (weak, nonatomic) IBOutlet UILabel *freeShopLabel; //包邮
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;   //价钱
@property (weak, nonatomic) IBOutlet UILabel *freshPriceLabel;//已购

@end

@implementation HYTearchCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = kBagroundColor;
}

@end

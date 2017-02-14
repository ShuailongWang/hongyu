//
//  HYDressListCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYDressListCell.h"

@interface HYDressListCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;    //图标
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;//地址
@property (weak, nonatomic) IBOutlet UILabel *freeShopLabel;//包邮
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;//价钱
@property (weak, nonatomic) IBOutlet UILabel *freshPriceLabel;//已经购买

@end

@implementation HYDressListCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = kBagroundColor;
}

@end

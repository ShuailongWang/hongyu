//
//  HYFoodSectionView.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYFoodSectionView.h"

@interface HYFoodSectionView()

@property (nonatomic, strong) UIButton *iconBtn;

@end

@implementation HYFoodSectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _iconBtn) {
            _iconBtn = [[UIButton alloc]initWithFrame:self.bounds];
            _iconBtn.backgroundColor = [UIColor whiteColor];
            [_iconBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _iconBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            _iconBtn.userInteractionEnabled = NO;
            [_iconBtn setTitle:@"热卖推荐" forState:UIControlStateNormal];
            [self addSubview:_iconBtn];
        }
    }
    return self;
}

@end



@interface HYFoodSectionFootView()

@property (nonatomic, strong) UILabel *footLabel;

@end

@implementation HYFoodSectionFootView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _footLabel) {
            _footLabel = [[UILabel alloc]initWithFrame:self.bounds];
            _footLabel.text = @"今天就这么多了~";
            _footLabel.textAlignment = NSTextAlignmentCenter;
            _footLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:_footLabel];
        }
    }
    return self;
}

@end

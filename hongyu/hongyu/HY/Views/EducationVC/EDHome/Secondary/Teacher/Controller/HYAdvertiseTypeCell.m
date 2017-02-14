//
//  HYAdvertiseTypeCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYAdvertiseTypeCell.h"

@interface HYAdvertiseTypeCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HYAdvertiseTypeCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        if (nil == _titleLabel) {
            _titleLabel = [[UILabel alloc]initWithFrame:self.contentView.bounds];
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            _titleLabel.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:_titleLabel];
        }
    }
    return self;
}


//赋值
-(void)setTitleName:(NSString *)titleName{
    _titleName = titleName;
    
    self.titleLabel.text = titleName;
}

@end

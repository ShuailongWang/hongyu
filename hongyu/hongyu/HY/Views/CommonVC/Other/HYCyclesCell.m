//
//  HYCyclesCell.m
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYCyclesCell.h"

@interface HYCyclesCell()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollView;

@end

@implementation HYCyclesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _scrollView) {
            _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreen_Width, HYCyclesCellHeight) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
            _scrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
            _scrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
            _scrollView.imageURLStringsGroup = self.iconUrlArr;
            
            [self.contentView addSubview:_scrollView];
        }
    }
    return self;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.myBlock) {
        self.myBlock(index);
    }
}


-(NSArray *)iconUrlArr{
    if (nil == _iconUrlArr) {
        _iconUrlArr = @[
                        @"http://i4.piimg.com/11340/7f638e192b9079e6.jpg",
                        @"http://pic.58pic.com/58pic/13/75/13/01e58PICgPY_1024.jpg",
                        @"http://img1.3lian.com/2015/a1/113/d/10.jpg",
                        @"http://img.taopic.com/uploads/allimg/120828/214833-120RQ5521568.jpg"
                        ];
    }
    return _iconUrlArr;
}

@end

//
//  HYCollectionCycleCell.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCollectionCycleCell.h"

@interface HYCollectionCycleCell()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollView;

@end

@implementation HYCollectionCycleCell


-(SDCycleScrollView *)scrollView{
    if (nil == _scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreen_Width, HYCollectionCycleCellHeight) delegate:self placeholderImage:[UIImage imageNamed:@"error"]];
        _scrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
        _scrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
        
        
        [self.contentView addSubview:_scrollView];
    }
    return _scrollView;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.myBlock) {
        self.myBlock(index);
    }
}

-(void)setIconUrlArr:(NSArray *)iconUrlArr{
    _iconUrlArr = iconUrlArr;
    
    self.scrollView.imageURLStringsGroup = iconUrlArr;
}


@end

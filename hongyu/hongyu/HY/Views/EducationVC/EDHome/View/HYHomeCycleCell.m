//
//  HYHomeCycleCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeCycleCell.h"
#import "HYHomeNewsModel.h"

@interface HYHomeCycleCell()<SDCycleScrollViewDelegate>

@property (strong,nonatomic) UIImageView *iconView;
@property (strong,nonatomic) SDCycleScrollView *cycleScrollView;

@end

@implementation HYHomeCycleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ){
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.cycleScrollView];
    }
    return self;
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (self.myBlock) {
        HYHomeNewsModel *model = self.newsArr[index];
        self.myBlock(model.Url);
    }
}

-(void)setNewsArr:(NSArray *)newsArr{
    _newsArr = newsArr;
    
    NSMutableArray *arrM = [NSMutableArray array];
    for (HYHomeNewsModel *newsModel in newsArr) {
        [arrM addObject:newsModel.Title];
    }
    
    self.cycleScrollView.titlesGroup = arrM.copy;
}


#pragma mark - 懒加载
-(UIImageView *)iconView{
    if (nil == _iconView) {
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        _iconView.image = [UIImage imageNamed:@"localnews"];
    }
    return _iconView;
}
-(SDCycleScrollView *)cycleScrollView{
    if (nil == _cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(_iconView.right + 5, 10, KScreen_Width - _iconView.right - 15, 40) delegate:self placeholderImage:nil];
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _cycleScrollView.onlyDisplayText = YES;
        _cycleScrollView.titleLabelTextColor = RGB(143, 143, 143);
        _cycleScrollView.titleLabelBackgroundColor = kClearColor;
        _cycleScrollView.titleLabelTextFont = [UIFont systemFontOfSize:16];
    }
    return _cycleScrollView;
}
@end

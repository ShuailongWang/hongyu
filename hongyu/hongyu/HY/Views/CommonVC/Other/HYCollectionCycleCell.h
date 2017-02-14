//
//  HYCollectionCycleCell.h
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HYCollectionCycleCellHeight      150
@interface HYCollectionCycleCell : UICollectionViewCell

@property (nonatomic, strong) NSArray *iconUrlArr;
@property (copy,nonatomic) void(^myBlock)(NSInteger index);

@end

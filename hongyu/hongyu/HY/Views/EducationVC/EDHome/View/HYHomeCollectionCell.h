//
//  HYHomeCollectionCell.h
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define    HYHomeCollectionCellHeight      80

@class HYHomeCollectionCell;
@protocol HYHomeCollectionCellDelegate <NSObject>

-(void)RGHomeCollCell:(HYHomeCollectionCell*)homeCollCell index:(NSInteger)index itemTitle:(NSString*)itemTitle;

@end

@interface HYHomeCollectionCell : UITableViewCell

@property (weak,nonatomic) id<HYHomeCollectionCellDelegate> delegate;
@property (nonatomic, strong) NSArray *typeArr;

@end

//
//  HYHomeCollcationCellToCell.h
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Title   @"Title"
#define Icon    @"Icon"
@interface HYHomeCollcationCellToCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

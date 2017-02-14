//
//  HYFoodDetailsPictureCell.h
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HYFoodDetailsPictureCellHeight 180

@interface HYFoodDetailsPictureCell : UITableViewCell

@property (strong,nonatomic) NSArray *pictArr;

@end


@interface HYFoodDetailsPictureToCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView *iconImageView;

@end

//
//  HYCyclesCell.h
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HYCyclesCellHeight      150
@interface HYCyclesCell : UITableViewCell

@property (nonatomic, strong) NSArray *iconUrlArr;
@property (copy,nonatomic) void(^myBlock)(NSInteger index);

@end

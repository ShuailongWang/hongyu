//
//  HYHomeCycleCell.h
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYHomeCycleCell : UITableViewCell

@property (nonatomic, strong) NSArray *newsArr;
@property (copy,nonatomic) void(^myBlock)(NSString *urlStr);

@end

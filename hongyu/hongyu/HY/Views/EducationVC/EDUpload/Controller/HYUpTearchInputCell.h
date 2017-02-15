//
//  HYUpTearchInputCell.h
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYUpTearchInputCell;
@protocol HYUpTearchInputCellDelegate <NSObject>

@optional
-(void)HYUpTearchInputCell:(HYUpTearchInputCell*)cell uid:(NSString*)uid inputStr:(NSString*)inputStr;
-(void)HYUpTearchInputCell:(HYUpTearchInputCell*)cell uid:(NSString*)uid inputLabel:(UILabel*)inputLabel;

@end

@interface HYUpTearchInputCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *dict;
@property (weak,nonatomic) id<HYUpTearchInputCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;
- (void)showTapLabel;
- (void)showTextField;

@end

//
//  HYCompContCell.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCompContCell.h"
#import "HYJobModel.h"

@interface HYCompContCell()

@property (weak, nonatomic) IBOutlet UILabel *ContactLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactEmailLabel;

@end

@implementation HYCompContCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setFrame:(CGRect)frame{
    //修改cell的左右边距为10;
    //修改cell的Y值下移10;
    //修改cell的高度减少10;
    
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2 * frame.origin.x;
    
    [super setFrame:frame];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYCompContCell";
    
    HYCompContCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYJobModel *)model{
    _model = model;
    self.ContactLabel.text = model.ContactName;
    self.contactPhoneLabel.text = model.ContactPhone;
    self.contactEmailLabel.text = model.ContactEmail;
}

@end

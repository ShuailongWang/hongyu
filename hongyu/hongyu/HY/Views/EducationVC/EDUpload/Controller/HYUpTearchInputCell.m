//
//  HYUpTearchInputCell.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYUpTearchInputCell.h"

@interface HYUpTearchInputCell()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *inputLabel;

@end

@implementation HYUpTearchInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.inputTextField.delegate = self;
    self.inputLabel.userInteractionEnabled = YES;
    //手势对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.inputLabel addGestureRecognizer:tap];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYUpTearchInputCell";
    
    HYUpTearchInputCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

//赋值
-(void)setDict:(NSDictionary *)dict{
    _dict = dict;
    
    self.titleLabel.text = dict[@"Title"];
    self.inputTextField.placeholder = dict[@"PlaceTitle"];
}
//显示那个控件
-(void)showTapLabel{
    self.inputLabel.hidden = NO;
}
-(void)showTextField{
    self.inputTextField.hidden = NO;
}

//点击label
-(void)tap{
    if ([self.delegate respondsToSelector:@selector(HYUpTearchInputCell:uid:inputLabel:)]) {
        [self.delegate HYUpTearchInputCell:self uid:self.dict[@"UID"] inputLabel:self.inputLabel];
    }
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(HYUpTearchInputCell:uid:inputStr:)]) {
        [self.delegate HYUpTearchInputCell:self uid:self.dict[@"UID"] inputStr:textField.text];
    }
}

@end

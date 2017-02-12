//
//  HYJudgeView.m
//  hongyu
//
//  Created by WSL on 17/2/12.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYJudgeView.h"

@implementation HYJudgeView

+ (instancetype)CreatView{
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"HYJudgeView" owner:nil options:nil];
    HYJudgeView *judgeView = [array lastObject];
    return judgeView;
}



//好的评价
- (IBAction)clickGoodButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(judgeView:selectBtnTag:)]) {
        [self.delegate judgeView:self selectBtnTag:sender.tag];
    }
}


@end

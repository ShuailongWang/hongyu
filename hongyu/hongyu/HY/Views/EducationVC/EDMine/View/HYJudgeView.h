//
//  HYJudgeView.h
//  hongyu
//
//  Created by WSL on 17/2/12.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYJudgeView;
@protocol HYJudgeViewDelegate <NSObject>

-(void)judgeView:(HYJudgeView*)judgeView selectBtnTag:(NSInteger)selectBtnTag;

@end

@interface HYJudgeView : UIView

@property (weak,nonatomic) id<HYJudgeViewDelegate> delegate;

+ (instancetype)CreatView;

@end

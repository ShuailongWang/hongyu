//
//  HYJudgeController.m
//  hongyu
//
//  Created by WSL on 17/2/12.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYJudgeController.h"
#import "HYJudgeView.h"

@interface HYJudgeController ()<HYJudgeViewDelegate>

@end

@implementation HYJudgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"给我们评价";
    [self setupUI];
}


-(void)setupUI{
    HYJudgeView *judegeView = [HYJudgeView CreatView];
    judegeView.frame = CGRectMake(0, 64, KScreen_Width, 205);
    judegeView.delegate = self;
    [self.view addSubview:judegeView];
}


-(void)judgeView:(HYJudgeView *)judgeView selectBtnTag:(NSInteger)selectBtnTag{
    if (selectBtnTag == 701) {
        
    }else if (selectBtnTag == 702) {
        
    }
}

@end

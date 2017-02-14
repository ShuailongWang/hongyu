//
//  HYEDUploadController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDUploadController.h"
#import "HYEDUpTeachController.h"
#import "HYEDUpJobController.h"
#import "HYEDUpProjectController.h"

@interface HYEDUploadController ()

@end

@implementation HYEDUploadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}


//设置UI
-(void)setupUI{
    CGFloat height = (KScreen_Height - 4 * 20)/6;
    CGFloat magrin = 30;
    for (NSInteger i = 0; i < 3; i++) {
        
        CGFloat y = i * (height + magrin);
        
        UIButton *Btn = [[UIButton alloc]initWithFrame:CGRectMake(magrin, y + 80, KScreen_Width - magrin * 2, height)];
        Btn.tag = i + 30;
        [Btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"butten_0%zd", i]] forState:UIControlStateNormal];
        [Btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:Btn];
    }
}
-(void)clickButton:(UIButton*)sender{
    switch (sender.tag) {
        case 30:{
            HYEDUpTeachController *teachVC = [[HYEDUpTeachController alloc]init];
            [self.navigationController pushViewController:teachVC animated:YES];
        }
            break;
        case 31:{
            HYEDUpJobController *jobVC = [[HYEDUpJobController alloc]init];
            [self.navigationController pushViewController:jobVC animated:YES];
        }
            break;
        case 32:{
            HYEDUpProjectController *projectVC = [[HYEDUpProjectController alloc]init];
            [self.navigationController pushViewController:projectVC animated:YES];
        }
            break;
        default:
            break;
    }
}


@end

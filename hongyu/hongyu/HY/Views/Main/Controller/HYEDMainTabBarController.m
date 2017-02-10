//
//  HYEDMainTabBarController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDMainTabBarController.h"
#import "HYEDHomeController.h"
#import "HYEDUploadController.h"
#import "HYEDNewsController.h"
#import "HYEDMineController.h"

@interface HYEDMainTabBarController ()

@end

@implementation HYEDMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[[HYEDHomeController alloc]init] ImageName:@"home" title:@"首页"];
    [self addChildViewController:[[HYEDUploadController alloc]init] ImageName:@"upload" title:@"发布"];
    [self addChildViewController:[[HYEDNewsController alloc]init] ImageName:@"message" title:@"消息"];
    [self addChildViewController:[[HYEDMineController alloc]init] ImageName:@"me" title:@"个人中心"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

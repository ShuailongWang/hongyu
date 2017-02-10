//
//  HYOTMainTabBarController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYOTMainTabBarController.h"
#import "HYOTHomeController.h"
#import "HYOTUploadController.h"
#import "HYOTNewsController.h"
#import "HYOTMineController.h"

@interface HYOTMainTabBarController ()

@end

@implementation HYOTMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[[HYOTHomeController alloc]init] ImageName:@"home" title:@"首页"];
    [self addChildViewController:[[HYOTUploadController alloc]init] ImageName:@"upload" title:@"发布"];
    [self addChildViewController:[[HYOTNewsController alloc]init] ImageName:@"message" title:@"消息"];
    [self addChildViewController:[[HYOTMineController alloc]init] ImageName:@"me" title:@"个人中心"];
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

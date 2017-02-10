//
//  HYBaseTabBarController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYBaseTabBarController.h"

@interface HYBaseTabBarController ()

@end

@implementation HYBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加控制器
-(void)addChildViewController:(UIViewController *)childController ImageName:(NSString*)imageName title:(NSString*)title{
    //  设置图片
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    //  修改渲染模式
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];
    childController.tabBarItem.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //  设置标题
    childController.title = title;
    //  设置文字颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    //  设置字体大小
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    [self addChildViewController:childController];
    
    //  添加到导航控制器
    HYMainNavController *hyNVC = [[HYMainNavController alloc]initWithRootViewController:childController];
    
    //  给当前对象添加子视图控制器
    [self addChildViewController:hyNVC];
    
}

@end

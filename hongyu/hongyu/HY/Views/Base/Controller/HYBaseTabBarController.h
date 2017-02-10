//
//  HYBaseTabBarController.h
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYBaseTabBarController : UITabBarController

//添加控制器
-(void)addChildViewController:(UIViewController *)childController ImageName:(NSString*)imageName title:(NSString*)title;

@end

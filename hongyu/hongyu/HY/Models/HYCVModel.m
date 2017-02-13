//
//  HYCVModel.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYCVModel.h"

@implementation HYCVModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Items" : [HYCVItemsModel class] };
}

@end




@implementation HYCVItemsModel

@end

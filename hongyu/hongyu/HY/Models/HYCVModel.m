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

+(NSArray *)HYCVModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CVList" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYCVModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
}

@end




@implementation HYCVItemsModel

@end

//
//  HYHomeModel.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYHomeModel.h"
#import "HYCVModel.h"

@implementation HYHomeModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"homeTypeArr" : [HYHomeTypeModel class],
             @"homeNewsArr" : [HYHomeNewsModel class],
             @"homeCVArr" : [HYCVModel class] };
}

+(NSArray *)HYHomeModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeList" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    
    for (int i = 0; i < array.count; i++) {
        NSArray *arr = array[i];
        NSMutableArray *arrayNext = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            if (i == 0) {
                [arrayNext addObject:[HYHomeTypeModel yy_modelWithDictionary:dict]];
            }else if (i == 1) {
                [arrayNext addObject:[HYHomeNewsModel yy_modelWithDictionary:dict]];
            }else if (i == 2) {
                [arrayNext addObject:[HYCVModel yy_modelWithDictionary:dict]];
            }
        }
        
        [arrayM addObject:arrayNext];
    }
    return arrayM.copy;
}

@end


@implementation HYHomeTypeModel
@end

@implementation HYHomeNewsModel
@end

//
//  HYHomeTypeModel.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYHomeTypeModel.h"

@implementation HYHomeTypeModel

+(NSArray *)HYHomeTypeModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeTypeList" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYHomeTypeModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
}

@end

//
//  HYJobModel.m
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYJobModel.h"

@implementation HYJobModel

+(NSArray *)HYJobModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeList" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYJobModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
}


@end

//
//  HYHomeNewsModel.m
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYHomeNewsModel.h"

@implementation HYHomeNewsModel

+(NSArray *)HYHomeNewsModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeNewsList" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYHomeNewsModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
}

@end

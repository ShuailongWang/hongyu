//
//  HYHomeTypeModel.h
//  hongyu
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYHomeTypeModel : NSObject

@property (nonatomic, copy) NSString *Title;
@property (nonatomic, copy) NSString *Icon;//后期修改成NSUrl

+(NSArray *)HYHomeTypeModelWithArray;

@end

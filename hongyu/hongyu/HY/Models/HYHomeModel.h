//
//  HYHomeModel.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.


#import <Foundation/Foundation.h>

@class HYHomeTypeModel, HYHomeNewsModel, HYCVModel;
@interface HYHomeModel : NSObject

@property (nonatomic, strong) NSArray *homeTypeArr;
@property (nonatomic, strong) NSArray *homeNewsArr;
@property (nonatomic, strong) NSArray *homeCVArr;

+(NSArray *)HYHomeModelWithArray;

@end


//MARK: - 类别
@interface HYHomeTypeModel : NSObject

@property (nonatomic, copy) NSString *Title;
@property (nonatomic, copy) NSString *Icon;//后期修改成NSUrl

@end

//MARK: - 新闻
@interface HYHomeNewsModel : NSObject

@property (nonatomic, copy) NSString *Title;
@property (nonatomic, copy) NSString *Url;

@end


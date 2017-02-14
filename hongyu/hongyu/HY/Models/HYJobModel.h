//
//  HYJobModel.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYJobModel : NSObject

@property (nonatomic, strong) NSNumber *JobID;
@property (nonatomic, copy) NSString *JobName;  //职位
@property (nonatomic, copy) NSString *PublishTime;//时间
@property (nonatomic, copy) NSString *PublishTimeDt;//具体时间
@property (nonatomic, copy) NSString *Salary;//薪资
@property (nonatomic, copy) NSString *Salary60;//薪资缩写
@property (nonatomic, copy) NSString *WorkCity;//工作城市
@property (nonatomic, copy) NSString *WorkingExp;//年限
@property (nonatomic, copy) NSString *Education;//学历
@property (nonatomic, strong) NSArray *WelfareTab;//福利
@property (nonatomic, copy) NSString *CompanyLogo;//图标
@property (nonatomic, copy) NSString *UploadName;//发布人
@property (nonatomic, copy) NSString *UploadJob;//发布人的职位
@property (nonatomic, copy) NSString *CompanyName;//公司名字
@property (nonatomic, copy) NSString *JobDetails;//职位详情
@property (nonatomic, copy) NSString *ContactName;//联系人
@property (nonatomic, copy) NSString *ContactPhone;//联系电话
@property (nonatomic, copy) NSString *ContactEmail;//邮箱
@property (nonatomic, copy) NSString *WorkAddress;//工作地址

+(NSArray *)HYJobModelWithArray;

@end

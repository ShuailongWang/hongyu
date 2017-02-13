//
//  HYJobModel.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYJobModel : NSObject

@property (nonatomic, copy) NSString *JobName;
@property (nonatomic, copy) NSString *PublishTime;
@property (nonatomic, copy) NSString *PublishTimeDt;
@property (nonatomic, copy) NSString *Salary;
@property (nonatomic, copy) NSString *Salary60;
@property (nonatomic, copy) NSString *WorkCity;
@property (nonatomic, copy) NSString *WorkingExp;
@property (nonatomic, copy) NSString *Education;
@property (nonatomic, strong) NSArray *WelfareTab;
@property (nonatomic, copy) NSString *CompanyLogo;
@property (nonatomic, copy) NSString *UploadName;
@property (nonatomic, copy) NSString *CompanyName;
@property (nonatomic, copy) NSString *JobDetails;
@property (nonatomic, copy) NSString *ContactName;
@property (nonatomic, copy) NSString *ContactPhone;
@property (nonatomic, copy) NSString *ContactEmail;
@property (nonatomic, copy) NSString *WorkAddress;

+(NSArray *)HYJobModelWithArray;

@end

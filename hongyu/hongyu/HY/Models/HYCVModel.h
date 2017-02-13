//
//  HYCVModel.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//  Curriculum vitae

#import <Foundation/Foundation.h>

@interface HYCVModel : NSObject

@property (nonatomic, copy) NSString *PublishTime;
@property (nonatomic, copy) NSString *PublishTimeDt;
@property (nonatomic, copy) NSString *UserPicture;
@property (nonatomic, copy) NSString *UserName;
@property (nonatomic, strong) NSNumber *Sex;
@property (nonatomic, copy) NSString *SexString;
@property (nonatomic, copy) NSString *WorkCity;
@property (nonatomic, copy) NSString *WorkingExp;
@property (nonatomic, copy) NSString *Education;
@property (nonatomic, copy) NSString *UserPhone;
@property (nonatomic, copy) NSString *UserEmail;
@property (nonatomic, strong) NSNumber *Age;
@property (nonatomic, strong) NSNumber *Overseas;
@property (nonatomic, copy) NSString *JobName;
@property (nonatomic, copy) NSString *JobType;
@property (nonatomic, copy) NSString *CityDistrict;
@property (nonatomic, copy) NSString *ExpectJob;
@property (nonatomic, copy) NSString *EmplType;
@property (nonatomic, copy) NSString *Salary;
@property (nonatomic, copy) NSString *Salary60;
@property (nonatomic, strong) NSArray *Items;
@property (nonatomic, copy) NSString *Speciiality;
@property (nonatomic, copy) NSString *School;
@property (nonatomic, copy) NSString *StartTime;
@property (nonatomic, copy) NSString *EndTime;



@end


@interface HYCVItemsModel : NSObject

@property (nonatomic, copy) NSString *JobName;
@property (nonatomic, copy) NSString *CompanyName;
@property (nonatomic, copy) NSString *StartTime;
@property (nonatomic, copy) NSString *EndTime;
@property (nonatomic, copy) NSString *Summary;

@end

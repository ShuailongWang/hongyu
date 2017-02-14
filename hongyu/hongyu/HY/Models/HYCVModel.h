//
//  HYCVModel.h
//  hongyu
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//  Curriculum vitae

#import <Foundation/Foundation.h>

@interface HYCVModel : NSObject

@property (nonatomic, strong) NSNumber *CVID;   //ID
@property (nonatomic, copy) NSString *PublishTime;  //时间
@property (nonatomic, copy) NSString *PublishTimeDt;//具体时间
@property (nonatomic, copy) NSString *UserPicture;  //头像
@property (nonatomic, copy) NSString *UserName; //用户名
@property (nonatomic, strong) NSNumber *Sex;    //性别
@property (nonatomic, copy) NSString *SexString;//性别文字
@property (nonatomic, copy) NSString *WorkCity;//工作城市
@property (nonatomic, copy) NSString *WorkingExp;//共组年限
@property (nonatomic, copy) NSString *Education;    //学历
@property (nonatomic, copy) NSString *UserPhone;    //电话
@property (nonatomic, copy) NSString *UserEmail;    //邮箱
@property (nonatomic, strong) NSNumber *Age;    //年龄
@property (nonatomic, strong) NSNumber *Overseas;//海外
@property (nonatomic, copy) NSString *JobName;//工作名字
@property (nonatomic, copy) NSString *JobType;//工作类型
@property (nonatomic, copy) NSString *CityDistrict;//工作城市
@property (nonatomic, copy) NSString *ExpectJob;//期望工作
@property (nonatomic, copy) NSString *EmplType;//工作类型
@property (nonatomic, copy) NSString *Salary;//薪资
@property (nonatomic, copy) NSString *Salary60;//薪资缩写
@property (nonatomic, strong) NSArray *Items;//数组
@property (nonatomic, copy) NSString *Speciiality;//专业
@property (nonatomic, copy) NSString *School;//学校
@property (nonatomic, copy) NSString *StartTime;//开始时间
@property (nonatomic, copy) NSString *EndTime;//结束时间

+(NSArray *)HYCVModelWithArray;

@end


@interface HYCVItemsModel : NSObject

@property (nonatomic, copy) NSString *JobName;      //职位
@property (nonatomic, copy) NSString *CompanyName;  //公司名字
@property (nonatomic, copy) NSString *StartTime;    //开始时间
@property (nonatomic, copy) NSString *EndTime;      //结束时间
@property (nonatomic, copy) NSString *Summary;      //职责

@end

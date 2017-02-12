//
//  HYSettingController.m
//  hongyu
//
//  Created by WSL on 17/2/12.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYSettingController.h"
#import "HYJudgeController.h"
#import "HYHelpController.h"
#import "HYAboutController.h"

@interface HYSettingController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) UISwitch *mySwitch;

@end

static NSString *UITableViewCellID = @"UITableViewCellID";

@implementation HYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"设置";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 3;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        //1.获取NSUserDefaults对象
        NSUserDefaults * userDef = [NSUserDefaults standardUserDefaults];
        self.mySwitch.on = [userDef boolForKey:@"UITableViewCellSaveNew"];
        
        cell.textLabel.text = @"消息设置";
        cell.accessoryView = self.mySwitch;
        
        return cell;
    }
    //右边箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"给我们评价";
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"帮助";
        }else{
            cell.textLabel.text = @"关于";
        }
    } else {
        cell.textLabel.text = @"退出登录";
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //评价
            HYJudgeController *judgeVC = [[HYJudgeController alloc]init];
            [self.navigationController pushViewController:judgeVC animated:YES];
        }else if (indexPath.row == 1) {
            //帮助
            HYHelpController *helpVC = [[HYHelpController alloc]init];
            [self.navigationController pushViewController:helpVC animated:YES];
        }else{
            //关于
            HYAboutController *aboutVC = [[HYAboutController alloc]init];
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
    } else if (indexPath.section == 2) {
        //退出登录
        
    }
}
-(void)changeSwitch:(UISwitch*)sender{
    //获取NSUserDefaults对象
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.isOn forKey:@"UITableViewCellSaveNew"];
    //立即存储
    [userDefaults synchronize];
}

-(UISwitch *)mySwitch{
    if (nil == _mySwitch) {
        _mySwitch = [[UISwitch alloc]init];
        [_mySwitch addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mySwitch;
}

@end

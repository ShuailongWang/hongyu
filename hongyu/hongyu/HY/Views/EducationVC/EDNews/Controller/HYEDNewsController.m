//
//  HYEDNewsController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDNewsController.h"
#import "HYNewsCell.h"
#import "HYEDNewsDetailsController.h"

@interface HYEDNewsController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSMutableArray *newsData;

@property (strong,nonatomic) NSArray *array;

@end

@implementation HYEDNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupUI];
}

-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"忽略" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_myTableView];
    }
}
-(void)clickRightButton{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"是否忽略全部消息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        for (NSInteger i = 0; i < self.newsData.count + 1; i++) {
            HYNewsCell *cell = (HYNewsCell *)[self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
            [cell hideRedImage];
        }
    }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}


#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1 + self.newsData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYNewsCell *cell = [HYNewsCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"5496";
        cell.subTitle.text = @"显示消息内部的标题";
        cell.iconView.image = [UIImage imageNamed:@"error"];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HYEDNewsDetailsController *detailsVC = [[HYEDNewsDetailsController alloc]init];
    
    [self.navigationController pushViewController:detailsVC animated:YES];
}
//左滑删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [NSObject showErrorMsg:@"官方消息无法删除"];
    }
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row != 0) {
        
        
    }
}


-(NSMutableArray *)newsData{
    if (nil == _newsData) {
        _newsData = [NSMutableArray array];
    }
    return _newsData;
}
-(NSArray *)array{
    if (nil == _array) {
        
    }
    return _array;
}



@end

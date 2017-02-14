//
//  HYEDUpTeachController.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDUpTeachController.h"
#import "HYUpTearchInputCell.h"

@interface HYEDUpTeachController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation HYEDUpTeachController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"发布职位(1/2)";
    [self setupUI];
    
}

-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(clickNextButton)];
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
}
-(void)clickNextButton{
    NSLog(@"123");
}


#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYUpTearchInputCell *cell = [HYUpTearchInputCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    return cell;
}



@end

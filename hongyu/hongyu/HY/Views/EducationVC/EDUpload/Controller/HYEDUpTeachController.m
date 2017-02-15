//
//  HYEDUpTeachController.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDUpTeachController.h"
#import "HYUpTearchInputCell.h"

@interface HYEDUpTeachController ()<UITableViewDelegate, UITableViewDataSource, HYUpTearchInputCellDelegate>

@property (nonatomic, strong) TPKeyboardAvoidingTableView *myTableView;
@property (nonatomic, strong) CusPickerView *cusPickerView;
@property (nonatomic, strong) CusDatePickerView *cusDateView;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSMutableDictionary *dictM;
@property (nonatomic, strong) NSArray *pickerArr;

@end

@implementation HYEDUpTeachController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"发布职位(1/2)";
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!_cusPickerView){
        _cusPickerView = [[CusPickerView alloc]init];
    }
    if (!_cusDateView){
        _cusDateView = [[CusDatePickerView alloc]init];
    }
}

-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(clickNextButton)];
    if (nil == _myTableView) {
        _myTableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - 事件
//下一步
-(void)clickNextButton{
    NSLog(@"123");
}
//显示选择框
-(void)showPickerView:(NSString*)uid inputLabel:(UILabel*)inputLabel{
    [self.cusPickerView show];
    //回调,赋值
    self.cusPickerView.myBlock = ^(NSString *selectStr){
        inputLabel.text = selectStr;
    };
}
-(void)showDateView:(NSString*)uid inputLabel:(UILabel*)inputLabel{
    [self.cusDateView show];
    //回调,赋值
    self.cusDateView.myBlock = ^(NSString *selectStr){
        inputLabel.text = selectStr;
    };
}


#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titleArr[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYUpTearchInputCell *cell = [HYUpTearchInputCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;    //选中后没有颜色
    cell.delegate = self;
    
    //
    if (indexPath.section == 1) {
        [cell showTapLabel];
    }else{
        [cell showTextField];
    }
    //标题赋值
    NSDictionary *dict = self.titleArr[indexPath.section][indexPath.row];
    cell.dict = dict;
    
    return cell;
}

#pragma mark - HYUpTearchInputCellDelegate
-(void)HYUpTearchInputCell:(HYUpTearchInputCell *)cell uid:(NSString *)uid inputStr:(NSString *)inputStr{
    //添加到字典中
    self.dictM[uid] = inputStr;
}
-(void)HYUpTearchInputCell:(HYUpTearchInputCell *)cell uid:(NSString *)uid inputLabel:(UILabel *)inputLabel{
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:cell];
    if (indexPath.section == 1) {
        
    }
    [self showPickerView:uid inputLabel:inputLabel];
}


#pragma mark - lan
-(NSArray *)pickerArr{
    if (nil == _pickerArr) {
        
    }
    return _pickerArr;
}
-(NSArray *)titleArr{
    if (nil == _titleArr) {
        _titleArr = @[
                      @[@{@"UID":@"name1",@"Title":@"标题1", @"PlaceTitle":@"输入1"}],
                      @[@{@"UID":@"name2",@"Title":@"标题2", @"PlaceTitle":@"输入2"},
                          @{@"UID":@"name3",@"Title":@"标题3", @"PlaceTitle":@"输入3"},
                          @{@"UID":@"name4",@"Title":@"标题4", @"PlaceTitle":@"输入4"},
                          @{@"UID":@"name5",@"Title":@"标题5", @"PlaceTitle":@"输入5"}],
                      @[@{@"UID":@"name6",@"Title":@"标题6", @"PlaceTitle":@"输入6"},
                          @{@"UID":@"name7",@"Title":@"标题7", @"PlaceTitle":@"输入7"},
                          @{@"UID":@"name8",@"Title":@"标题8", @"PlaceTitle":@"输入8"},
                          @{@"UID":@"name9",@"Title":@"标题9", @"PlaceTitle":@"输入9"}]
                      ];
    }
    return _titleArr;
}
-(NSMutableDictionary *)dictM{
    if (nil == _dictM) {
        _dictM = [NSMutableDictionary dictionary];
    }
    return _dictM;
}
@end

//
//  HYFoodDetailsController.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYFoodDetailsController.h"
#import "HYFoodDetailsPictureCell.h"
#import "HYFoodDetailInfoCell.h"

@interface HYFoodDetailsController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;

@end

@implementation HYFoodDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = kBagroundColor;
        [self.view addSubview:_myTableView];
    }
}


#pragma mark - UICollectionView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        HYFoodDetailsPictureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYFoodDetailsPictureCellID"];
        if (nil == cell) {
            cell = [[HYFoodDetailsPictureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYFoodDetailsPictureCellID"];
        }
        cell.pictArr = @[@"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                         @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                         @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                         @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                         @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                         @"http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg"
                         ];
        return cell;
    }
    HYFoodDetailInfoCell *cell = [HYFoodDetailInfoCell cellWithTableView:tableView NSIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return HYFoodDetailsPictureCellHeight;
    }
    return 95;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


@end

//
//  HYFoodController.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYFoodController.h"
#import "HYFoodSectionView.h"
#import "HYCollectionCycleCell.h"
#import "HYFoodTypeCell.h"
#import "HYFoodListCell.h"
#import "HYFoodListController.h"
#import "HYFoodDetailsController.h"

@interface HYFoodController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *typeArr;
@property (nonatomic, strong) NSArray *freshData;

@end

static NSString *HYFoodSectionViewID = @"HYFoodSectionView";    //组头
static NSString *HYFoodSectionFootViewID = @"HYFoodSectionFootView";    //组wei

static NSString *HYCollectionCycleCellID = @"HYCollectionCycleCellID";
static NSString *HYFoodTypeCellID = @"HYFoodTypeCell";
static NSString *HYFoodListCellID = @"HYFoodListCell";


@implementation HYFoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupUI];
}

-(void)setupUI{
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.backgroundColor = kBagroundColor;
        //组头
        [_myCollectionView registerClass:[HYFoodSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HYFoodSectionViewID];
        [_myCollectionView registerClass:[HYFoodSectionFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HYFoodSectionFootViewID];
        
        //cell
        [_myCollectionView registerClass:[HYCollectionCycleCell class] forCellWithReuseIdentifier:HYCollectionCycleCellID];
        [_myCollectionView registerNib:[UINib nibWithNibName:HYFoodTypeCellID bundle:nil] forCellWithReuseIdentifier:HYFoodTypeCellID];
        [_myCollectionView registerNib:[UINib nibWithNibName:HYFoodListCellID bundle:nil] forCellWithReuseIdentifier:HYFoodListCellID];
        [self.view addSubview:_myCollectionView];
    }
}


#pragma mark - UICollectionDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 5;
    }
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HYCollectionCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYCollectionCycleCellID forIndexPath:indexPath];
        cell.iconUrlArr = @[
                            @"http://i4.piimg.com/11340/7f638e192b9079e6.jpg",
                            @"http://pic.58pic.com/58pic/13/75/13/01e58PICgPY_1024.jpg",
                            @"http://img1.3lian.com/2015/a1/113/d/10.jpg",
                            @"http://img.taopic.com/uploads/allimg/120828/214833-120RQ5521568.jpg"
                            ];
        return cell;
    }else if (indexPath.section == 1) {
        //
        HYFoodTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYFoodTypeCellID forIndexPath:indexPath];
        
        NSDictionary *dict = self.typeArr[indexPath.item];
        cell.iconImageView.image = [UIImage imageNamed:dict[@"Icon"]];
        cell.titleLabel.text = dict[@"Title"];
        
        return cell;
    }
    HYFoodListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYFoodListCellID forIndexPath:indexPath];
    
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 10, 0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(KScreen_Width, HYCollectionCycleCellHeight);
    }else if (indexPath.section == 1) {
        return CGSizeMake(KScreen_Width/5, 94);
    }
    return CGSizeMake(KScreen_Width/2, 250);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return CGSizeZero;
    }
    return CGSizeMake(KScreen_Width, 40);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return CGSizeZero;
    }
    return CGSizeMake(KScreen_Width, 30);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //组头
    if (kind == UICollectionElementKindSectionHeader) {
        HYFoodSectionView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HYFoodSectionViewID forIndexPath:indexPath];
        resuableView.titleName = @"热卖推荐";
        return resuableView;
    }
    //组尾
    HYFoodSectionFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HYFoodSectionFootViewID forIndexPath:indexPath];
    return footView;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        //子界面
        HYFoodListController *foodListVC = [[HYFoodListController alloc]init];
        
        NSDictionary *dict = self.typeArr[indexPath.item];
        foodListVC.title = dict[@"Title"];
        
        [self.navigationController pushViewController:foodListVC animated:YES];
        
    }else if (indexPath.section == 2){
        HYFoodDetailsController *foodDetailsVC = [[HYFoodDetailsController alloc]init];
        [self.navigationController pushViewController:foodDetailsVC animated:YES];
    }
}


#pragma mark - 懒加载
-(NSArray *)typeArr{
    if (nil == _typeArr) {
        _typeArr = @[
                     @{@"Title":@"新鲜水果", @"Icon":@"fruit"},
                     @{@"Title":@"蔬菜蛋类", @"Icon":@"vegetables"},
                     @{@"Title":@"精品肉类", @"Icon":@"meat"},
                     @{@"Title":@"海鲜水产", @"Icon":@"seafood"},
                     @{@"Title":@"冰饮冻食", @"Icon":@"frozenFood"}
                     ];
    }
    return _typeArr;
}

@end

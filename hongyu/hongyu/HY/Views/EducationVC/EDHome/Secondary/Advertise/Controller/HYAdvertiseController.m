//
//  HYAdvertiseController.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYAdvertiseController.h"
#import "HYCVModel.h"
#import "HYFoodSectionView.h"
#import "HYAdvertiseTypeCell.h"
#import "HYAdvertiseJobCell.h"
#import "HYCVController.h"

@interface HYAdvertiseController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *typeArr;
@property (strong,nonatomic) NSArray *CVList;

@end

static NSString *HYFoodSectionViewID = @"HYFoodSectionView";    //组头
static NSString *HYFoodSectionFootViewID = @"HYFoodSectionFootView";    //组wei
static NSString *HYAdvertiseTypeCellID = @"HYAdvertiseTypeCellID";
static NSString *HYAdvertiseJobCellID = @"HYAdvertiseJobCell";

@implementation HYAdvertiseController

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
        [_myCollectionView registerClass:[HYAdvertiseTypeCell class] forCellWithReuseIdentifier:HYAdvertiseTypeCellID];
        [_myCollectionView registerNib:[UINib nibWithNibName:HYAdvertiseJobCellID bundle:nil] forCellWithReuseIdentifier:HYAdvertiseJobCellID];
        [self.view addSubview:_myCollectionView];
    }
}

#pragma mark - UICollectionDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return self.typeArr.count;
    }
    return self.CVList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HYAdvertiseTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYAdvertiseTypeCellID forIndexPath:indexPath];
        cell.titleName = self.typeArr[indexPath.item];
        return cell;
    
    }
    //列表
    HYAdvertiseJobCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYAdvertiseJobCellID forIndexPath:indexPath];
    
    HYCVModel *model = self.CVList[indexPath.item];
    cell.model = model;
    
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 10, 0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(KScreen_Width/4, 40);
    }
    return CGSizeMake(KScreen_Width, 177);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(KScreen_Width, 40);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(KScreen_Width, 30);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //组头
    if (kind == UICollectionElementKindSectionHeader) {
        HYFoodSectionView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HYFoodSectionViewID forIndexPath:indexPath];
        resuableView.titleName = @"猜你喜欢";
        return resuableView;
    }
    //组尾
    HYFoodSectionFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HYFoodSectionFootViewID forIndexPath:indexPath];
    return footView;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //类别
    if (indexPath.section == 0) {
        
    }else if(indexPath.section == 1){
        //详情
        HYCVController *CVVC = [[HYCVController alloc]init];
        
        HYCVModel *model = self.CVList[indexPath.item];
        CVVC.model = model;
        
        [self.navigationController pushViewController:CVVC animated:YES];
    }
}

#pragma mark - 懒加载
-(NSArray *)typeArr{
    if (nil == _typeArr) {
        _typeArr = @[@"保安", @"保育", @"测试", @"测试文字", @"保安", @"保育", @"测试", @"测试文字", @"保安", @"保育", @"测试", @"测试文字"];
    }
    return _typeArr;
}
-(NSArray *)CVList{
    if (nil == _CVList) {
        _CVList = [HYCVModel HYCVModelWithArray];
    }
    return _CVList;
}


@end

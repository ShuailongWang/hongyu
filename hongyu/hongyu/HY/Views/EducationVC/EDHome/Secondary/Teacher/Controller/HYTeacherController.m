//
//  HYTeacherController.m
//  hongyu
//
//  Created by WSL on 17/2/13.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYTeacherController.h"
#import "HYFoodSectionView.h"
#import "HYFoodTypeCell.h"
#import "HYTearchCell.h"
#import "HYTearcherListController.h"

@interface HYTeacherController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *typeArr;

@end

static NSString *HYFoodSectionViewID = @"HYFoodSectionView";    //组头
static NSString *HYFoodSectionFootViewID = @"HYFoodSectionFootView";    //组wei
static NSString *HYFoodTypeCellID = @"HYFoodTypeCell";
static NSString *HYTearchCellID = @"HYTearchCell";

@implementation HYTeacherController

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
        [_myCollectionView registerNib:[UINib nibWithNibName:HYFoodTypeCellID bundle:nil] forCellWithReuseIdentifier:HYFoodTypeCellID];
        [_myCollectionView registerNib:[UINib nibWithNibName:HYTearchCellID bundle:nil] forCellWithReuseIdentifier:HYTearchCellID];
        [self.view addSubview:_myCollectionView];
    }
}

#pragma mark - UICollectionDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return 4;
    }
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //
        HYFoodTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYFoodTypeCellID forIndexPath:indexPath];
        
        NSDictionary *dict = self.typeArr[indexPath.item];
        cell.iconImageView.image = [UIImage imageNamed:dict[@"Icon"]];
        cell.titleLabel.text = dict[@"Title"];
        
        return cell;
    }
    HYTearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYTearchCellID forIndexPath:indexPath];
    
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 10, 0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(KScreen_Width/4, 94);
    }
    return CGSizeMake(KScreen_Width, 120);
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
        resuableView.titleName = @"热卖推荐";
        return resuableView;
    }
    //组尾
    HYFoodSectionFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HYFoodSectionFootViewID forIndexPath:indexPath];
    return footView;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HYTearcherListController *tearchListVC = [[HYTearcherListController alloc]init];
        
        NSDictionary *dict = self.typeArr[indexPath.item];
        tearchListVC.title = dict[@"Title"];
        
        [self.navigationController pushViewController:tearchListVC animated:YES];
    }
    
}



#pragma mark - 懒加载
-(NSArray *)typeArr{
    if (nil == _typeArr) {
        _typeArr = @[
                     @{@"Title":@"课桌", @"Icon":@"Desk"},
                     @{@"Title":@"课椅", @"Icon":@"Chair"},
                     @{@"Title":@"黑板", @"Icon":@"lessons"},
                     @{@"Title":@"其它", @"Icon":@"ellipsis"}
                     ];
    }
    return _typeArr;
}

@end

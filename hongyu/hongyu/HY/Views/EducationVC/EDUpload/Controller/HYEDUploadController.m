//
//  HYEDUploadController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYEDUploadController.h"
#import "HYHomeCollcationCellToCell.h"

@interface HYEDUploadController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (strong,nonatomic) NSArray *array;

@end

static NSString *HYHomeCollcationCellToCellID = @"HYHomeCollcationCellToCellID";

@implementation HYEDUploadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//设置UI
-(void)setupUI{
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(KScreen_Width/3, KScreen_Width/3);
        _myCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        [_myCollectionView registerNib:[UINib nibWithNibName:@"HYHomeCollcationCellToCell" bundle: nil] forCellWithReuseIdentifier:HYHomeCollcationCellToCellID];
        [self.view addSubview:_myCollectionView];
    }
}



@end

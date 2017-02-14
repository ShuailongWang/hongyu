//
//  HYFoodDetailsPictureCell.m
//  hongyu
//
//  Created by WSL on 17/2/14.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYFoodDetailsPictureCell.h"

@interface HYFoodDetailsPictureCell()<UICollectionViewDelegate, UICollectionViewDataSource, SDPhotoBrowserDelegate>

@property (strong,nonatomic) UICollectionView *myCollectionView;

@end

static NSString *HYFoodDetailsPictureToCellID = @"HYFoodDetailsPictureToCellID";

@implementation HYFoodDetailsPictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _myCollectionView) {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 0;
            flowLayout.minimumInteritemSpacing = 0;
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            flowLayout.itemSize = CGSizeMake(KScreen_Width, HYFoodDetailsPictureCellHeight);
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYFoodDetailsPictureCellHeight) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.dataSource = self;
            _myCollectionView.pagingEnabled = YES;
            _myCollectionView.backgroundColor = kBagroundColor;
            [_myCollectionView registerClass:[HYFoodDetailsPictureToCell class] forCellWithReuseIdentifier:HYFoodDetailsPictureToCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}

#pragma mark - UICollectionDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pictArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYFoodDetailsPictureToCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYFoodDetailsPictureToCellID forIndexPath:indexPath];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.pictArr[indexPath.item]] placeholderImage:[UIImage imageNamed:@"error"]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    //原图的父控件
    browser.sourceImagesContainerView = collectionView;
    //原图的数量
    browser.imageCount = self.pictArr.count;
    //当前需要展示图片的index
    browser.currentImageIndex = indexPath.item;
    //代理
    browser.delegate = self;
    // 展示图片浏览器
    [browser show];
}
// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:self.pictArr[index]];
}


//
-(void)setPictArr:(NSArray *)pictArr{
    _pictArr = pictArr;
    
    [self.myCollectionView reloadData];
}

@end


#pragma mark - HYFoodDetailsPictureToCell
@implementation HYFoodDetailsPictureToCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _iconImageView) {
            _iconImageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
            [self.contentView addSubview:_iconImageView];
        }
    }
    return self;
}

@end

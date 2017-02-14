//
//  HYHomeCollectionCell.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYHomeCollectionCell.h"
#import "HYHomeCollcationCellToCell.h"
#import "HYHomeTypeModel.h"

@interface HYHomeCollectionCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *myCollectionView;

@end

static NSString *HYHomeCollcationCellToCellID = @"HYHomeCollcationCellToCellID";

@implementation HYHomeCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _myCollectionView) {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 0;
            flowLayout.minimumInteritemSpacing = 0;
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYHomeCollectionCellHeight * 2) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.dataSource = self;
            _myCollectionView.backgroundColor = [UIColor whiteColor];
            [_myCollectionView registerNib: [UINib nibWithNibName:@"HYHomeCollcationCellToCell" bundle:nil] forCellWithReuseIdentifier:HYHomeCollcationCellToCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}

#pragma mark - UICollectionDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.typeArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYHomeCollcationCellToCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYHomeCollcationCellToCellID forIndexPath:indexPath];
    
    HYHomeTypeModel *model = self.typeArr[indexPath.item];
    cell.titleLabel.text = model.Title;
    cell.iconImageView.image = [UIImage imageNamed: model.Icon];
//    cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"error"];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //
    HYHomeTypeModel *model = self.typeArr[indexPath.item];
    
    //代理
    if ([self.delegate respondsToSelector:@selector(RGHomeCollCell:index:itemTitle:)]) {
        [self.delegate RGHomeCollCell:self index:indexPath.item itemTitle:model.Title];
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake( KScreen_Width / 3, HYHomeCollectionCellHeight);
}

-(void)setTypeArr:(NSArray *)typeArr{
    _typeArr = typeArr;
    
    [self.myCollectionView reloadData];
}

@end

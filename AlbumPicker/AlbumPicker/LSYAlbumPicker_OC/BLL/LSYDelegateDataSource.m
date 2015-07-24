//
//  LSYDelegateDataSource.m
//  AlbumPicker
//
//  Created by okwei on 15/7/24.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYDelegateDataSource.h"
@interface LSYDelegateDataSource ()
@end
@implementation LSYDelegateDataSource

#pragma mark -UICollectionViewDelegate


#pragma mark -UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSYAlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAlbumCellIdentifer forIndexPath:indexPath];
    cell.asset = self.dataArr[indexPath.row];
    return cell;
}
@end

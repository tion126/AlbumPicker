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
    return self.albumDataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSYAlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAlbumCellIdentifer forIndexPath:indexPath];
    cell.asset = self.albumDataArray[indexPath.row];
    return cell;
}

#pragma mark -UITableViewDelegate


#pragma mark -UITabViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSYAlbumCatalogCell *cell = [tableView dequeueReusableCellWithIdentifier:kAlbumCatalogCellIdentifer];
    if (cell == nil) {
        cell = [[LSYAlbumCatalogCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
@end

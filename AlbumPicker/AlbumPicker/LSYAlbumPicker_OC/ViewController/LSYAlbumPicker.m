//
//  LSYAlbumPicker.m
//  AlbumPicker
//
//  Created by okwei on 15/7/23.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYAlbumPicker.h"
#import "LSYDelegateDataSource.h"
#import "LSYAlbum.h"
#import "LSYPickerButtomView.h"
#import "LSYAssetPreview.h"
@interface LSYAlbumPicker ()<UICollectionViewDelegate,LSYPickerButtomViewDelegate>
@property (nonatomic,strong) UICollectionView *albumView;
@property (nonatomic,strong) LSYDelegateDataSource *albumDelegateDataSource;
@property (nonatomic,strong) NSMutableArray *albumAssets;
@property (nonatomic,strong) LSYPickerButtomView *pickerButtomView;
@property (nonatomic)int selectNumbers;
@end

@implementation LSYAlbumPicker

-(UICollectionView *)albumView
{
    if (!_albumView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = kThumbnailSize;
        flowLayout.sectionInset = UIEdgeInsetsMake(5,5,5, 5);
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.minimumLineSpacing = 5;
        _albumView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ViewSize(self.view).width, ViewSize(self.view).height-40) collectionViewLayout:flowLayout];
        _albumView.allowsMultipleSelection = YES;
        [_albumView registerClass:[LSYAlbumCell class] forCellWithReuseIdentifier:kAlbumCellIdentifer];
        _albumView.delegate = self;
        _albumView.dataSource = self.albumDelegateDataSource;
        _albumView.backgroundColor = [UIColor whiteColor];
        _albumView.alwaysBounceVertical = YES;
    }
    return _albumView;
}
-(LSYDelegateDataSource *)albumDelegateDataSource
{
    if (!_albumDelegateDataSource) {
        _albumDelegateDataSource = [[LSYDelegateDataSource alloc] init];
    }
    return _albumDelegateDataSource;
}
-(LSYPickerButtomView *)pickerButtomView
{
    if (!_pickerButtomView) {
        _pickerButtomView = [[LSYPickerButtomView alloc] initWithFrame:CGRectMake(0, ViewSize(self.view).height-40, ViewSize(self.view).width, 40)];
        _pickerButtomView.delegate = self;
        [_pickerButtomView setSendNumber:self.selectNumbers];
    }
    return _pickerButtomView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.albumView];
    [self.view addSubview:self.pickerButtomView];
    [[LSYAlbum sharedAlbum] setupAlbumAssets:self.group withAssets:^(NSMutableArray *assets) {
        self.albumAssets = assets;
        self.albumDelegateDataSource.albumDataArray = assets;
        [self.albumView reloadData];
    }];
    // Do any additional setup after loading the view.
}
-(void)setSelectNumbers:(int)selectNumbers
{
    _selectNumbers = selectNumbers;
    [self.pickerButtomView setSendNumber:selectNumbers];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

#pragma mark -LSYPickerButtomViewDelegate
-(void)previewButtonClick
{
    LSYAssetPreview *assetPreview = [[LSYAssetPreview alloc] init];
    [self.navigationController pushViewController:assetPreview animated:YES];
    assetPreview.assets = [self getSelectedItems];
}
-(void)sendButtonClick
{
    NSLog(@"sendButtonClick");
}
#pragma mark -UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectNumbers = (int)collectionView.indexPathsForSelectedItems.count;
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectNumbers = (int)collectionView.indexPathsForSelectedItems.count;
}
-(NSArray *)getSelectedItems
{
    NSMutableArray *itemsArray = [NSMutableArray array];
    for (NSIndexPath *indexPath in _albumView.indexPathsForSelectedItems) {
        [itemsArray addObject:self.albumAssets[indexPath.row]];
    }
    return itemsArray;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

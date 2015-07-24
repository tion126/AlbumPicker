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
@interface LSYAlbumPicker ()<LSYAlbumDelegate>
@property (nonatomic,strong) UICollectionView *albumView;
@property (nonatomic,strong) LSYDelegateDataSource *albumDelegateDataSource;
@property (nonatomic,strong) NSMutableArray *albumGroups;
@property (nonatomic,strong) NSMutableArray *albumAssets;

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
        _albumView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ViewSize(self.view).width, ViewSize(self.view).height) collectionViewLayout:flowLayout];
        _albumView.allowsMultipleSelection = YES;
        [_albumView registerClass:[LSYAlbumCell class] forCellWithReuseIdentifier:kAlbumCellIdentifer];
        _albumView.delegate = self.albumDelegateDataSource;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.albumView];
    [LSYAlbum sharedAlbum].delegate = self;
    [[LSYAlbum sharedAlbum] setupAlbumGroups];
    // Do any additional setup after loading the view.
}


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -LSYAlbumDelegate
-(void)albumAssets:(NSMutableArray *)assets
{
    _albumAssets = assets;
    if (_albumAssets.count>0) {
        self.albumDelegateDataSource.dataArr = _albumAssets;
        [self.albumView reloadData];
    }
}
-(void)albumGroups:(NSMutableArray *)group
{
    _albumGroups = group;
    if (_albumGroups.count > 0) {
        [[LSYAlbum sharedAlbum] setupAlbumAssets:[_albumGroups firstObject]];
    }
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

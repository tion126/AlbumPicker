//
//  LSYAssetPreview.m
//  AlbumPicker
//
//  Created by okwei on 15/7/31.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYAssetPreview.h"
#import "LSYAssetPreviewView.h"
#import "LSYAssetPreviewItem.h"
#import "LSYAlbumModel.h"
@interface LSYAssetPreview ()<UIScrollViewDelegate,LSYAssetPreviewNavBarDelegate,LSYAssetPreviewToolBarDelegate>
@property (nonatomic,strong)UIScrollView *previewScrollView;
@property (nonatomic,strong) LSYAssetPreviewNavBar *previewNavBar;
@property (nonatomic,strong) LSYAssetPreviewToolBar *previewToolBar;
@end

@implementation LSYAssetPreview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self prefersStatusBarHidden];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.view addSubview:self.previewScrollView];
    [self.view addSubview:self.previewToolBar];
    [self.view addSubview:self.previewNavBar];
    [self setAssets];
}
-(UIScrollView *)previewScrollView
{
    if (!_previewScrollView) {
        _previewScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,ScreenSize.width, ScreenSize.height)];
        [_previewScrollView setBackgroundColor:[UIColor blackColor]];
        [_previewScrollView setPagingEnabled:YES];
        [_previewScrollView setDelegate:self];
        [_previewScrollView setShowsHorizontalScrollIndicator:NO];
        [_previewScrollView setShowsVerticalScrollIndicator:NO];

    }
    return _previewScrollView;
}
-(LSYAssetPreviewNavBar *)previewNavBar
{
    if (!_previewNavBar) {
        _previewNavBar = [[LSYAssetPreviewNavBar alloc] init];
        [_previewNavBar setBackgroundColor:[UIColor colorWithRed:19/255.0 green:19/255.0 blue:19/255.0 alpha:0.75]];
        _previewNavBar.delegate = self;
    }
    return _previewNavBar;
}
-(LSYAssetPreviewToolBar*)previewToolBar
{
    if (!_previewToolBar) {
        _previewToolBar = [[LSYAssetPreviewToolBar alloc] init];
        [_previewToolBar setBackgroundColor:[UIColor colorWithRed:19/255.0 green:19/255.0 blue:19/255.0 alpha:0.75]];
        _previewToolBar.delegate = self;
    }
    return _previewToolBar;
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)setAssets
{
    [self.previewScrollView setContentSize:CGSizeMake(ScreenSize.width*self.assets.count, ScreenSize.height)];
    for (int i = 0; i<_assets.count; i++) {
        LSYAssetPreviewItem *previewItem = [[LSYAssetPreviewItem alloc] initWithFrame:CGRectMake(ScreenSize.width*i, 0, ScreenSize.width, ScreenSize.height)];
        LSYAlbumModel *model = _assets[i];
        previewItem.asset = model.asset;
        [self.previewScrollView addSubview:previewItem];
    }
}
#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int assetNumber = scrollView.contentOffset.x/ViewSize(self.view).width;
    LSYAlbumModel *model = self.assets[assetNumber];
    self.previewNavBar.selectButton.selected = model.isSelect;
    
}
#pragma mark -LSYAssetPreviewNavBarDelegate
-(void)backButtonClick:(UIButton *)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)selectButtonClick:(UIButton *)selectButton
{
    int assetNumber = self.previewScrollView.contentOffset.x/ViewSize(self.view).width;
    LSYAlbumModel *model = self.assets[assetNumber];
    model.isSelect = !model.isSelect;
    self.previewNavBar.selectButton.selected = model.isSelect;
    if (model.isSelect) {
        [self.AlbumCollection selectItemAtIndexPath:model.indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }
    else
    {
        [self.AlbumCollection deselectItemAtIndexPath:model.indexPath animated:NO];
    }
}
#pragma mark -LSYAssetPreviewToolBarDelegate
-(void)sendButtonClick:(UIButton *)sendButton
{
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [_previewNavBar setFrame:CGRectMake(0, 0, ViewSize(self.view).width, 64)];
    [_previewToolBar setFrame:CGRectMake(0, ViewSize(self.view).height-44, ViewSize(self.view).width, 44)];
}
-(void)dealloc
{
    
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

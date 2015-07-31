//
//  LSYAssetPreview.m
//  AlbumPicker
//
//  Created by okwei on 15/7/31.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYAssetPreview.h"
#import "LSYAssetPreviewItem.h"
@interface LSYAssetPreview ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *previewScrollView;
@end

@implementation LSYAssetPreview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view addSubview:self.previewScrollView];
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
-(void)setAssets
{
    [self.previewScrollView setContentSize:CGSizeMake(ScreenSize.width*self.assets.count, ScreenSize.height)];
    for (int i = 0; i<_assets.count; i++) {
        LSYAssetPreviewItem *previewItem = [[LSYAssetPreviewItem alloc] initWithFrame:CGRectMake(ScreenSize.width*i, 0, ScreenSize.width, ScreenSize.height)];
         previewItem.asset = _assets[i];
        [self.previewScrollView addSubview:previewItem];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

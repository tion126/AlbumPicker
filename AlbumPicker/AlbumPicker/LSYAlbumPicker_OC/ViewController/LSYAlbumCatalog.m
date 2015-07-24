//
//  LSYAlbumCatalog.m
//  AlbumPicker
//
//  Created by okwei on 15/7/24.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYAlbumCatalog.h"
#import "LSYDelegateDataSource.h"
@interface LSYAlbumCatalog ()
@property (nonatomic,strong) UITableView *albumTabView;
@property (nonatomic,strong) LSYDelegateDataSource *albumDelegateDataSource;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation LSYAlbumCatalog

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.albumTabView];
}
-(UITableView *)albumTabView
{
    if (!_albumTabView) {
        _albumTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ViewSize(self.view).width, ViewSize(self.view).height) style:UITableViewStylePlain];
        _albumTabView.delegate = self.albumDelegateDataSource;
        _albumTabView.dataSource = self.albumDelegateDataSource;
        _albumTabView.rowHeight = 70;
        _albumTabView.tableFooterView = [[UIView alloc] init];
    }
    return _albumTabView;
}
-(LSYDelegateDataSource *)albumDelegateDataSource
{
    if (!_albumDelegateDataSource) {
        _albumDelegateDataSource = [[LSYDelegateDataSource alloc] init];
    }
    return _albumDelegateDataSource;
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

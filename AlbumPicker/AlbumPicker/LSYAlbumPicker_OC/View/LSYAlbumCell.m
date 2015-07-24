//
//  LSYAlbumCell.m
//  AlbumPicker
//
//  Created by okwei on 15/7/24.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYAlbumCell.h"
@interface LSYAlbumCell ()
@property (nonatomic,strong) UIImageView *imageView;
@end
@implementation LSYAlbumCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
-(void)setAsset:(ALAsset *)asset
{
    _asset = asset;
    _imageView.image = [UIImage imageWithCGImage:asset.thumbnail];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, ViewSize(self).width, ViewSize(self).height);
}
@end

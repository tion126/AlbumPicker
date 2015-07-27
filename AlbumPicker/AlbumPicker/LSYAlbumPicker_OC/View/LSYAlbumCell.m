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
@property (nonatomic,strong) UIImageView *statusView;
@end
@implementation LSYAlbumCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.imageView addSubview:self.statusView];
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
-(UIImageView *)statusView
{
    if (!_statusView) {
        _statusView = [[UIImageView alloc] init];
        [_statusView setImage:[UIImage imageNamed:@"AlbumPicker.bundle/CardPack_Add_UnSelected@2x"]];
    }
    return _statusView;
}
-(void)setAsset:(ALAsset *)asset
{
    _asset = asset;
    _imageView.image = [UIImage imageWithCGImage:asset.thumbnail];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        [self.statusView setImage:[UIImage imageNamed:@"AlbumPicker.bundle/FriendsSendsPicturesSelectYIcon@2x"]];
        [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionAllowUserInteraction animations:^{
            self.statusView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionAllowUserInteraction animations:^{
                self.statusView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionAllowUserInteraction animations:^{
                    self.statusView.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }
    else
    {
        [self.statusView setImage:[UIImage imageNamed:@"AlbumPicker.bundle/CardPack_Add_UnSelected@2x"]];
    }
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, ViewSize(self).width, ViewSize(self).height);
    self.statusView.frame = CGRectMake(ViewSize(self).width-30, 0, 30, 30);
}
@end

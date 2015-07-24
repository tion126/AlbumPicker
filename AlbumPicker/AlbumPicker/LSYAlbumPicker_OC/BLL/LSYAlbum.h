//
//  LSYAlbum.h
//  AlbumPicker
//
//  Created by okwei on 15/7/23.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LSYAlbumDelegate <NSObject>
-(void)albumGroups:(NSMutableArray *)group;
-(void)albumAssets:(NSMutableArray *)assets;
@end
@interface LSYAlbum : NSObject
@property (nonatomic,strong) ALAssetsGroup *assetsGroup;
@property (nonatomic,strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic,strong) ALAssetsFilter *assstsFilter;
@property (nonatomic,weak) id<LSYAlbumDelegate> delegate;
+(LSYAlbum *)sharedAlbum;
-(void)setupAlbumGroups;
-(void)setupAlbumAssets:(ALAssetsGroup *)group;
@end

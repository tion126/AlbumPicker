//
//  LSYAlbum.h
//  AlbumPicker
//
//  Created by okwei on 15/7/23.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface LSYAlbum : NSObject
@property (nonatomic,strong) ALAssetsGroup *assetsGroup;
@property (nonatomic,strong) ALAssetsLibrary *assetsLibrary;
+(LSYAlbum *)sharedAlbum;
@end

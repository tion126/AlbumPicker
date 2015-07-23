//
//  LSYAlbum.m
//  AlbumPicker
//
//  Created by okwei on 15/7/23.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "LSYAlbum.h"

@implementation LSYAlbum
+(LSYAlbum *)sharedAlbum{
    static LSYAlbum *album = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        album = [[LSYAlbum alloc] init];
    });
    return album;
}
@end

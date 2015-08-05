//
//  LSYAlbumModel.swift
//  AlbumPicker
//
//  Created by okwei on 15/8/4.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

import Foundation
import AssetsLibrary

public class LSYAlbumModel:NSObject{
    var asset:ALAsset!
    var indexPath:NSIndexPath!
    var assetType:String!
    //使用KVO类要继承NSObject 观察的属性用dynamic修饰
    dynamic var isSelect:Bool
    init(data:ALAsset)
    {
        self.asset = data;
        self.isSelect = false
        self.assetType = data.valueForProperty(ALAssetPropertyType) as? String
    }
    class func AlbumModel(data:ALAsset){
        LSYAlbumModel(data: data)
    }
}
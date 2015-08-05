//
//  LSYAlbumPicker.swift
//  AlbumPicker
//
//  Created by okwei on 15/8/5.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

import Foundation
import UIKit
import AssetsLibrary

protocol LSYAlbumPickerDelegate : class{
    func AlbumPickerDidFinishPick(assets:NSArray)
}
class LSYAlbumPicker: UIViewController {
    let kThumbnailLength :CGFloat = (UIScreen.mainScreen().bounds.size.width-5*5)/4
    let kAlbumPickerCellIdentifer :String = "albumPickerCellIdentifer"
    var group:ALAssetsGroup!
    var maxminumNumber:Int = 0
    weak var delegate:LSYAlbumPickerDelegate!
    var albumAssets:NSMutableArray!
    var assetsSort:NSMutableArray!
    var selectedAssetsZ:NSMutableArray!
    var flowLayout:UICollectionViewFlowLayout!{
        didSet{
            flowLayout.itemSize = CGSizeMake(self.kThumbnailLength, self.kThumbnailLength)
            flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
            flowLayout.minimumInteritemSpacing = 5;
            flowLayout.minimumLineSpacing = 5;
        }
    }
    var albumView:UICollectionView!{
        didSet{
            albumView.allowsMultipleSelection = true;
            albumView.delegate = self
            albumView.dataSource = self
            albumView.backgroundColor = UIColor.whiteColor()
            albumView.alwaysBounceVertical = true
        }
    }
    private func setup(){
        
    }
}
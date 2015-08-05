//
//  LSYAlbumDelegateClass.swift
//  AlbumPicker
//
//  Created by okwei on 15/8/4.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

import Foundation
import UIKit
import AssetsLibrary
//MARK:- LSYAlbumCatalog
//MARK:UITableViewDataSource,UITableViewDelegate
extension LSYAlbumCatalog:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : LSYAlbumCatalogCell! = tableView.dequeueReusableCellWithIdentifier(self.kAlbumCatalogCellIdentifer) as?LSYAlbumCatalogCell
        if cell == nil {
            cell = LSYAlbumCatalogCell(style: UITableViewCellStyle.Value1, reuseIdentifier: self.kAlbumCatalogCellIdentifer)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        cell.group = self.dataArray[indexPath.row] as? ALAssetsGroup
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var albumPicker:LSYAlbumPicker! = LSYAlbumPicker()
    }
}
//MARK:- LSYAlbumPicker
//MARK:LSYAlbumPicker:UICollectionViewDelegate,UICollectionViewDataSource
extension LSYAlbumPicker:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumAssets.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:LSYAlbumPickerCell! = collectionView.dequeueReusableCellWithReuseIdentifier(self.kAlbumPickerCellIdentifer, forIndexPath: indexPath) as? LSYAlbumPickerCell
        var model:LSYAlbumModel! = self.albumAssets[indexPath.row] as? LSYAlbumModel
        model.indexPath = indexPath
        cell.model = model
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var model:LSYAlbumModel! = self.albumAssets[indexPath.row] as? LSYAlbumModel
        model.isSelect = !model.isSelect
        
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        var model:LSYAlbumModel! = self.albumAssets[indexPath.row] as? LSYAlbumModel
        model.isSelect = !model.isSelect
    }
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    
}
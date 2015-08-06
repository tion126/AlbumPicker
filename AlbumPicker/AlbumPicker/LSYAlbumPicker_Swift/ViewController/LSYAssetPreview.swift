//
//  LSYAssetPreview.swift
//  AlbumPicker
//
//  Created by okwei on 15/8/6.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

import Foundation
import UIKit
protocol LSYAssetPreviewDelegate:class{
    func AssetPreviewDidFinishPick(assets:NSArray)->Void
}
class LSYAssetPreview: UIViewController {
    var assets :NSArray!
    var albumPickerCollection:UICollectionView!
    weak var delegate:LSYAssetPreviewDelegate!
    var selectedAssets:NSMutableArray!
    private var previewScrollView:UIScrollView!{
        didSet{
            previewScrollView.backgroundColor = UIColor.blackColor()
            previewScrollView.pagingEnabled = true
            previewScrollView.delegate = self
            previewScrollView.showsHorizontalScrollIndicator = false
            previewScrollView.showsVerticalScrollIndicator = false
            self.view.addSubview(previewScrollView)
        }
    }
    private var previewNavBar:LSYAssetPreviewNavBar!{
        didSet{
            previewNavBar.backgroundColor = UIColor(red: 19.0/255.0, green: 19.0/255.0, blue: 19.0/255.0, alpha: 0.75)
            previewNavBar.delegate = self
            self.view.addSubview(previewNavBar)
        }
    }
    private var previewToolBar:LSYAssetPreviewToolBar!{
        didSet{
            previewToolBar.backgroundColor = UIColor(red: 19.0/255.0, green: 19.0/255.0, blue: 19.0/255.0, alpha: 0.75)
            previewToolBar.delegate = self
            previewToolBar.setSendNumber(self.albumPickerCollection.indexPathsForSelectedItems().count)
            self.view.addSubview(previewToolBar)
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    private func setup() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.prefersStatusBarHidden()
        self.selectedAssets = NSMutableArray(array: self.assets)
        self.navigationController?.navigationBarHidden = true
        self.previewScrollView = UIScrollView(frame: CGRectMake(0, 0, LSYSwiftDefine.ViewSize(self.view).width,LSYSwiftDefine.ViewSize(self.view).height))
        
    }
    override func viewDidLayoutSubviews() {
        self.viewDidLayoutSubviews()
        self.previewNavBar.frame = CGRectMake(0, 0, LSYSwiftDefine.ViewSize(self.view).width,64)
        self.previewToolBar.frame = CGRectMake(0, LSYSwiftDefine.ViewSize(self.view).height-44, LSYSwiftDefine.ViewSize(self.view).width, 44)
    }
}
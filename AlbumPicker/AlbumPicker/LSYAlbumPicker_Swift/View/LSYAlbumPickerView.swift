//
//  LSYAlbumPickerView.swift
//  AlbumPicker
//
//  Created by okwei on 15/8/5.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

import Foundation
import UIKit
import AssetsLibrary
//MARK:- LSYAlbumPickerCell
class LSYAlbumPickerCell: UICollectionViewCell {
    var model:LSYAlbumModel!{
        didSet{
            if model.assetType == ALAssetTypeVideo {
                self.bottomView.hidden = false
                self.bottomView.interval = model.asset.valueForProperty(ALAssetPropertyDuration).doubleValue
            }
            else{
                self.bottomView.hidden = true
            }
            
            self.imageView.image = UIImage(CGImage: model.asset.thumbnail().takeUnretainedValue())
        }
    }
    private var imageView:UIImageView!{
        didSet{
            self.addSubview(imageView)
        }
    }
    private var statusView:UIImageView!{
        didSet{
            statusView.image = UIImage(named: "AlbumPicker.bundle/CardPack_Add_UnSelected@2x")
            self.addSubview(statusView)
        }
    }
    private var bottomView:LSYAlbumCellBottomView!{
        didSet{
            bottomView.backgroundColor = UIColor(red: 19.0/255.0, green: 9.0/255.0, blue: 9.0/255.0, alpha: 0.75)
            self.addSubview(bottomView)
        }
        
    }
    private func setup(){
        self.imageView = UIImageView()
        self.statusView = UIImageView()
        self.bottomView = LSYAlbumCellBottomView()
        self.addObserver(self.model, forKeyPath: "isSelect", options: NSKeyValueObservingOptions.New, context: nil)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if change[NSKeyValueChangeNewKey] as! Bool{
            self.statusView.image = UIImage(named:"AlbumPicker.bundle/FriendsSendsPicturesSelectYIcon@2x")
            UIView.animateWithDuration(0.15, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn|UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                self.statusView.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }, completion: { (finished) -> Void in
                UIView.animateWithDuration(0.15, delay: 0.0, options:  UIViewAnimationOptions.CurveEaseIn|UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.statusView.transform = CGAffineTransformMakeScale(1.2, 1.2);
                }, completion: { (finished) -> Void in
                    UIView.animateWithDuration(0.15, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn|UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                        self.statusView.transform = CGAffineTransformIdentity;
                    }, completion: { (finished) -> Void in
                        
                    })
                })
            })
            
        }
        else{
            self.statusView.image = UIImage(named: "AlbumPicker.bundle/CardPack_Add_UnSelected@2x")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = CGRectMake(0, 0, LSYSwiftDefine.ViewSize(self).width, LSYSwiftDefine.ViewSize(self).height)
        self.statusView.frame = CGRectMake(LSYSwiftDefine.ViewSize(self).width-30, 0, 30, 30)
        self.bottomView.frame = CGRectMake(0, LSYSwiftDefine.ViewSize(self).height-20, LSYSwiftDefine.ViewSize(self).width, 20)
    }
    deinit
    {
        self.removeObserver(self.model, forKeyPath: "isSelect")
    }
}

//MARK:- LSYAlbumCellBottomView
//MARK: Video Tag
class LSYAlbumCellBottomView:UIView{
    var interval:Double = 0{
        didSet{
            var hour:Int = 0
            var minute :Int = 0
            var second :Int = 0
            hour = Int(interval/3600.00)
            minute = Int((interval - Double(3600*hour))/60.00)
            second = Int((interval - Double(3600*hour))%60)
            if hour > 0{
                self.videoTime.text = String(format:"%02d:%02d:%02d", arguments: [hour,minute,second])
            }
            else{
                self.videoTime.text = String(format:"%02d:%02d", arguments: [minute,second])
            }
        }
    }
    private var videoImage:UIImageView!{
        didSet{
            self.addSubview(videoImage)
        }
    }
    private var videoTime:UILabel!{
        didSet{
            videoTime.font = UIFont.systemFontOfSize(14)
            videoTime.textColor = UIColor.whiteColor()
            videoTime.textAlignment = NSTextAlignment.Right
            self.addSubview(videoTime)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    private func setup(){
        self.videoTime = UILabel()
        self.videoImage = UIImageView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.videoImage.frame = CGRectMake(0, 0, 20, LSYSwiftDefine.ViewSize(self).height)
        self.videoTime.frame = CGRectMake(LSYSwiftDefine.ViewOrigin(self.videoImage).x+LSYSwiftDefine.ViewSize(self.videoImage).width, 0, LSYSwiftDefine.ViewSize(self).width-LSYSwiftDefine.ViewSize(self.videoImage).width-5, LSYSwiftDefine.ViewSize(self).height)
    }
    
}
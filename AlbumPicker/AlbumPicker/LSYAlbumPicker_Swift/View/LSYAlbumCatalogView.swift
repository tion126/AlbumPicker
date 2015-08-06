//
//  LSYAlbumCatalogView.swift
//  AlbumPicker
//
//  Created by okwei on 15/8/5.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

import Foundation
import UIKit
import AssetsLibrary

class LSYAlbumCatalogCell: UITableViewCell {
    var group:ALAssetsGroup!{
        didSet{
        self.imageView?.image = UIImage(CGImage: group.posterImage().takeUnretainedValue())
        self.setupGroupTitle()
        }
    }
    private func setupGroupTitle(){
        var groupTitleAttribute:Dictionary! = [NSForegroundColorAttributeName:UIColor.blackColor(),NSFontAttributeName:UIFont.boldSystemFontOfSize(17)]
        var numberOfAssetsAttribute:Dictionary! = [NSForegroundColorAttributeName:UIColor.grayColor(),NSFontAttributeName:UIFont.systemFontOfSize(17)]
        var groupTitle:String! = self.group.valueForProperty(ALAssetsGroupPropertyName) as? String
        var numberOfAssets:Int = self.group.numberOfAssets()
        var attributedString :NSMutableAttributedString! = NSMutableAttributedString(string: "\(groupTitle)（\(numberOfAssets)）", attributes: numberOfAssetsAttribute)
        attributedString.addAttributes(groupTitleAttribute, range: NSMakeRange(0, count(groupTitle)))
        self.textLabel?.attributedText = attributedString
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
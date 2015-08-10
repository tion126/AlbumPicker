//
//  ViewController.swift
//  AlbumPicker_Swift
//
//  Created by Labanotation on 15/8/10.
//  Copyright (c) 2015年 com.okwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func openAlbum(sender: AnyObject) {
        var albumCatalog:LSYAlbumCatalog! = LSYAlbumCatalog()
        albumCatalog.delegate = self
        var navigation:LSYNavigationController! = LSYNavigationController(rootViewController:albumCatalog)
        albumCatalog.maximumNumberOfSelectionMedia = 5
        self.presentViewController(navigation, animated: true) { () -> Void in
            
        }
    }


}
extension ViewController:LSYAlbumCatalogDelegate{
    func AlbumDidFinishPick(assets: NSArray) {
        println(assets)
    }
}

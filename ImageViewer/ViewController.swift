//
//  ViewController.swift
//  ImageViewer
//
//  Created by GibertJ on 3/08/22.
//

import UIKit

class ViewController: UITableViewController {
    
    // property to keep all values after viewDidLoad is destroyed
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign the value from file manager.default to fm
        let fm = FileManager.default
        // sets the directory/bundle containing the compiled app/assets
        // ! ensures resource dir is there
        let path = Bundle.main.resourcePath!
        // try to read and store in array contents of above path
        // try! will crash app if items not found. Valid since no content = no app
        let items = try! fm.contentsOfDirectory(atPath: path)
        // loop through all items found in the directory and check for right preffix nz
        for item in items {
            if item.hasPrefix("nz") {
                pictures.append(item)
            }
        }
        //print(pictures)
    }
}

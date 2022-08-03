//
//  ViewController.swift
//  ImageViewer
//
//  Created by GibertJ on 3/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign the value from file manager.default to fm
        let fm = FileManager.default
        // searches the directory/bundle containing the compiled app/assets
        // ! necessary since some non-iOS bundles may lack resouce path. This forces resource dir
        let path = Bundle.main.resourcePath!
        // try to read and store in array contents of above path in items const
        // try! will crash app if items not found. However contents MUST be made to be there
        let items = try! fm.contentsOfDirectory(atPath: path)

        }
    }
}

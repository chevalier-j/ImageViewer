//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by GibertJ on 4/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    // @IBOutlet attribute that tells xcode that there is a connection between this line and of code and the interface builder
    // UIImageView! optional allows to reserve space for it in memory regardless if it exist at the time this runs
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // checks optional in selectedImage. If selectedImage is null, code won't execute
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

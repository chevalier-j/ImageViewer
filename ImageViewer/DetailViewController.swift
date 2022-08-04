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
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationController!.navigationBar.backgroundColor = .white
        
        // creates new right bar button item with parameters
        // .action is a system icon. target and action parameters tell the UIBarButtonItem what method to call (shareTapped)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        // checks optional in selectedImage. If selectedImage is null, code won't execute
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
}
    // we override methods in UIViewController to customise the behaviour
    // enable hidesBarOnTap only when detail view is showing
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // disable hidesBarOnTap when detailview is not showing
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // @objc tells swift to compile this method for swift & visible to objective-c code (like UIBarButtonItem)
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        // share image using UIActivitiyViewController
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        // show ready UIActivityViewController in screen
        present(vc, animated: true)
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

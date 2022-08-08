//
//  ViewController.swift
//  ImageViewer
//
//  Created by GibertJ on 3/08/22.
//

import UIKit

// ViewController builds up on UITableViewController, overriding defaults from it
class ViewController: UITableViewController {
    
    // property to keep all values after viewDidLoad is destroyed
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        // sets the directory/bundle containing the compiled app/assets
        // ! ensures resource dir is there
        let path = Bundle.main.resourcePath!
        // try to read and store in array contents of above path
        // try! will crash app if items not found. Valid since no content = no app
        let items = try! fm.contentsOfDirectory(atPath: path)
        let sortedItems = items.sorted()
        // loop through all items found in the directory and check for "nz" preffix
        for item in sortedItems {
            if item.lowercased().hasSuffix(".jpg") ||
                item.lowercased().hasSuffix(".jpeg") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    // overriding defaults from UITableViewController
    // iOS method. Establishing how many rows should appear in the table:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // create one cell per picture:
        return pictures.count
    }
    // what each row should look like. Returns a type UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // recycle cells as they are no longer needed (ie while scrolling a table), improving performance
        // return cell to display information
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // rather than checking if there is text label or not we use ? for optional chaining ie: "do this only if text label data exists, elso do nothing"
        // give text label same text as the picture file name in our pictures array
        // we use indexPath.row to read corresponding picture from pictures array and place that into cell text label
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // if let protects application if storyboard? or instantiateViewController or as? DetailViewController fail, as the code won't run
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

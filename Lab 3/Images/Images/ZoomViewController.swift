//
//  ZoomViewController.swift
//  Images
//
//  Created by Andrew Taylor-Shaut on 3/7/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    
    @IBAction func share(_ sender: UIBarButtonItem) {
        var imageArray = [UIImage]()
        imageArray.append(imageZoom.image!)
        let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender as UIBarButtonItem
        present(shareScreen, animated: true, completion: nil)
    }

    @IBOutlet weak var imageZoom: UIImageView!
    var imageName : String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = imageName {
            imageZoom.image = UIImage(named: name)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

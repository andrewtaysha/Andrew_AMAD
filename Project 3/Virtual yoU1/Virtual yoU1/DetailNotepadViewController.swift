//
//  DetailNotepadViewController.swift
//  Virtual yoU1
//
//  Created by Andrew Taylor-Shaut on 5/8/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class DetailNotepadViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var text:String = ""
    var masterView:NotepadsTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.text = text
        textView.becomeFirstResponder()
    }
    
    func setText(t:String){
        text = t
        if isViewLoaded{
        textView.text = t
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//
//  AddListItemViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 3/14/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class AddListItemViewController: UIViewController {

    @IBOutlet weak var newListItemTextfield: UITextField!
    
    var addedListItem = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "doneNewListItemSegue"{
        if ((newListItemTextfield.text?.isEmpty) == false){
            addedListItem=newListItemTextfield.text!
        }
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

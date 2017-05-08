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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneNewListItemSegue"{
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
